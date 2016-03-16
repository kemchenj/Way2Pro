#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

typedef struct{
        int id;
        int set;
        char *name;
        char *email;
}Address;

struct Database {
        int MAX_ROWS;
        int MAX_DATA;
        Address* rows;
};

struct Connection {
        FILE *file;
        struct Database *db;
};

void Database_close(struct Connection *conn)
{
        if(conn) {
                if(conn->file) fclose(conn->file);
                if(conn->db) free(conn->db);
                free(conn);
        }
}

void die(const char *message, struct Connection *conn)
{
        if(errno) {
                perror(message);
        } else {
                printf("ERROR: %s\n", message);
        }

        Database_close(conn);

        exit(1);
}

void dieee(const char *message)
{
        if(errno) {
                perror(message);
        } else {
                printf("ERROR: %s\n", message);
        }

        exit(1);
}

void Address_print(Address *addr)
{
        printf("%d %s %s\n",
               addr->id, addr->name, addr->email);
}

void Database_load(struct Connection *conn)
{
        if(fread(conn->db, sizeof(struct Database), 1, conn->file) != 1)
                die("Failed to load database.", conn);

        conn->db->rows = (Address *)malloc(sizeof(Address) * conn->db->rows);
        if(!conn->db->rows) die("Memory error", conn);

        for (size_t i = 0; i < conn->db->MAX_ROWS; i++) {
                interim[i].name = (char*)malloc(sizeof(char) * conn->db->MAX_DATA);
                interim[i].email = (char*)malloc(sizeof(char) * conn->db->MAX_DATA);
        }

        if(fread(conn->db->rows, sizeof(conn->db->rows), 1, conn->file) != 1)
                die("Failed to load rows.", conn);
}

struct Connection *Database_open(const char *filename, char mode)
{
        struct Connection *conn = malloc(sizeof(struct Connection));
        if(!conn) die("Memory error", conn);

        struct Database temp =

        if(mode == 'c') {
                conn->file = fopen(filename, "w");
        } else {
                conn->file = fopen(filename, "r+");

                if(conn->file) {
                        Database_load(conn);
                }
        }

        if(!conn->file) die("Failed to open the file", conn);

        return conn;
}

void Database_write(struct Connection *conn)
{
        rewind(conn->file);

        if()

        if(fflush(conn->file) != -1) die("Cannot flush database.", conn);
}

void Database_create(struct Connection *conn)
{
        Address interim[conn->MAX_ROWS];
        conn->db->rows = (struct*)interim;

        for (int i = 0; i < conn->db->MAX_ROWS; i++) {
                conn->db->rows[i].name = (char*)malloc(sizeof(char) * conn->db->MAX_DATA);
                conn->db->rows[i].email = (char*)malloc(sizeof(char) * conn->db->MAX_DATA);
        }

        if(fwrite(conn->db, sizeof(struct Database), 1, conn->file) != 1)
                die("Failed to write database.", conn);

        for(int i = 0; i < conn->db->MAX_ROWS; i++) {
                Address addr = {.id = i, .set = 0, .};
                conn->db->rows[i] = addr;
        }
}

void Database_set(struct Connection *conn, int id, char *name, const char *email)
{
        Address *addr = &conn->db->rows[id];
        if(addr->set) die("Already set, delete it first", conn);

        addr->set = 1;

        char *res = strncpy(addr->name, name, MAX_DATA);

        if(!res) die("Name copy failed", conn);

        res = strncpy(addr->email, email, MAX_DATA);
        if(!res) die("Email copy failed", conn);
}

void Database_get(struct Connection *conn, int id)
{
        Address *addr = &conn->db->rows[id];

        if(addr->set) {
                Address_print(addr);
        } else {
                die("ID is not set", conn);
        }
}

void Database_delete(struct Connection *conn, int id)
{
        Address addr = {.id = id, .set = 0};
        conn->db->rows[id] = addr;
}

void Database_list(struct Connection *conn)
{
        int i = 0;
        struct Database *db = conn->db;

        for(i = 0; i < MAX_ROWS; i++) {
                Address *cur = &db->rows[i];

                if(cur->set) {
                        Address_print(cur);
                }
        }
}

int main(int argc, char *argv[])
{
        if(argc < 3) dieee("USAGE: ex17 <dbfile> <action> [action params]");

        char *filename = argv[1];
        char action = argv[2][0];
        struct Connection *conn = Database_open(filename, action);

        int id = 0;
        if(argc > 3) id = atoi(argv[3]);

        if(id >= conn->db->MAX_ROWS) die("There's not that many records.", conn);

        switch(action) {

        case 'c':
                Database_create(conn);
                Database_write(conn);
                break;

        case 'g':
                if(argc != 4) die("Need an id to get", conn);

                Database_get(conn, id);
                break;

        case 's':
                if(argc != 6) die("Need id, name, email to set", conn);

                Database_set(conn, id, argv[4], argv[5]);
                Database_write(conn);

        case 'd':
                if(argc != 4) die("Need id to delete", conn);

                Database_delete(conn, id);
                Database_write(conn);
                break;

        case 'l':
                Database_list(conn);
                break;

        default:
                die("Invalid action, only: c=create, g=get, s=set, d=del, l=list", conn);
        }

        Database_close(conn);

        return 0;
}
