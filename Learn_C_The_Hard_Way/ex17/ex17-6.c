#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

struct Address {
        int id;
        int set;
        char* name;
        char* email;
};

struct Database {
        int MAX_ROWS;
        int MAX_DATA;
        struct Address* rows;
};

struct Connection {
        FILE* file;
        struct Database* db;
};

void die(char* message)
{
        if(errno) {
                perror(message);
        } else {
                printf("ERROR: %s\n", message);
        }

        exit(1);
}

void Address_print(struct Address* addr)
{
        printf("%d %s %s\n",
               addr->id, addr->name, addr->email);
}

void Database_create(struct Connection* conn)
{
        printf("MAX_ROWS: ");
        scanf("%d", &conn->db->MAX_ROWS);
        if (conn->db->MAX_ROWS<=0) die("MAX_ROWS must be positive");

        printf("MAX_DATA: ");
        scanf("%d", &conn->db->MAX_DATA);
        if (conn->db->MAX_DATA<=0) die("MAX_DATA must be positive");

        conn->db->rows = (struct Address*)malloc(sizeof(struct Address)*conn->db->MAX_ROWS);

        for(size_t i = 0; i < conn->db->MAX_ROWS; i++) {
                char* a = (char*)malloc(conn->db->MAX_DATA);
                memset(a, 0, conn->db->MAX_DATA);
                char* b = (char*)malloc(conn->db->MAX_DATA);
                memset(b, 0, conn->db->MAX_DATA);

                struct Address addr = {.id = i, .set = 0, .name = a, .email = b};

                conn->db->rows[i] = addr;
        }
}

void Database_write(struct Connection* conn)
{
        rewind(conn->file);

        if(fwrite(conn->db, sizeof(struct Database), 1, conn->file) != 1)
                die("Failed to write database.");
        if(fwrite(conn->db->rows, sizeof(conn->db->rows), 1, conn->file) != 1)
                die("Failed to write rows");

        fflush(conn->file);
}

void Database_set(struct Connection* conn, int id, char* name, const char* email)
{
        struct Address* addr = &conn->db->rows[id];
        if(addr->set) die("Already set, delete it first");

        addr->set = 1;

        strncpy(addr->name, name, conn->db->MAX_DATA);
        strncpy(addr->email, email, conn->db->MAX_DATA);
}

void Database_get(struct Connection* conn, int id)
{
        struct Address* addr = &conn->db->rows[id];

        if(addr->set) {
                Address_print(addr);
        } else {
                die("ID is not set");
        }
}

void Database_delete(struct Connection* conn, int id)
{
        struct Address addr = {.id = id, .set = 0};
        conn->db->rows[id] = addr;
}

void Database_list(struct Connection* conn)
{
        for(int i = 0; i < conn->db->MAX_ROWS; i++) {
                if(conn->db->rows[i].set) {
                        Address_print(&(conn->db->rows[i]));
                }
        }
}

void Database_find(struct Connection* conn, char* keyword) {
        int i=0;
        int count=0;

        while (i < conn->db->MAX_ROWS) {
                while ( i<conn->db->MAX_ROWS) {
                        if(conn->db->rows[i].set==1){
                                if(strstr(conn->db->rows[i].name, keyword) != NULL || strstr(conn->db->rows[i].email, keyword) != NULL){
                                        break;
                                }
                        }
                        i++;
                }

                if(i >= conn->db->MAX_ROWS) break;

                Address_print(&(conn->db->rows[i]));
                count++;
                i++;
        }

        if (count==0) {
                printf("Try some other words\n");
        }
}

int main(int argc, char* argv[])
{
        if(argc < 3) die("USAGE: ex17 <dbfile> <action> [action params]");
        int id = 0;
        if(argc > 3) id = atoi(argv[3]);

        char* filename = argv[1];
        char action = argv[2][0];

        struct Connection temp_conn;
        struct Connection* conn = &temp_conn;

        struct Database temp_db;
        conn->db = &temp_db;
        
        if(action == 'c') {
                conn->file = fopen(filename, "w");
        } else {
                conn->file = fopen(filename, "r+");

                if(conn->file) {
                        assert(conn->db && conn->file);

                        struct Address temp_rows[conn->db->MAX_ROWS];
                        conn->db->rows = temp_rows;

                        if(fread(conn->db, sizeof(conn->db), 1, conn->file) != 1)
                                die("Failed to load database.");
                        // if(fread(conn->db->rows, sizeof(conn->db->rows), 1, conn->file) != 1)
                        //         die("Failed to load database.");
                }
        }

        switch(action) {
        case 'c':
                Database_create(conn);
                Database_write(conn);

                printf("\nDone\n");
                break;

        case 'g':
                if(argc != 4) die("Need an id to get");

                Database_get(conn, id);
                break;

        case 's':
                if(argc != 6) die("Need id, name, email to set");

                Database_set(conn, id, argv[4], argv[5]);
                Database_write(conn);
                break;

        case 'd':
                if(argc != 4) die("Need id to delete");

                Database_delete(conn, id);
                Database_write(conn);
                break;

        case 'l':
                Database_list(conn);
                break;

        case 'f':
                if(argc != 4) die("Need keyword to search.");
                Database_find(conn, argv[3]);
                break;

        default:
                die("Invalid action, only: c=create, g=get, s=set, d=del, l=list， f=find");
        }

        return 0;
}
