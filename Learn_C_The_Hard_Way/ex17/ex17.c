#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

// #define MAX_DATA 512
// #define MAX_ROWS 50
//定义两个常量，主要是针对预编译

// int MAX_ROWS, MAX_DATA;

struct Address {
        int id;
        int set;
        char name[MAX_DATA];
        char email[MAX_DATA];
        //初始化的时候顺便定义长度
};
// 数据项

struct Database {
        struct Address rows[MAX_ROWS];
};

struct Connection {
        FILE *file;
        //来自stdlib的类型，跟后续的fopen，fread，fclose和rewind有关
        struct Database *db;
};
//Connection类型包括文件指针，以及接收文件的内存起始点

void Database_close(struct Connection *conn)
{
        if(conn) {
                if(conn->file) fclose(conn->file);
                //使用fclose()函数就可以把缓冲区内最后剩余的数据输出到内核缓冲区，并释放文件指针和有关的缓冲区。
                if(conn->db) free(conn->db);
                //把文件指针释放掉，line 61
                free(conn);
                //line 58
        }
}

void die(const char *message, struct Connection *conn)
{
        if(errno) {
                perror(message);
                //print error
        } else {
                printf("ERROR: %s\n", message);
        }

        Database_close(conn);

        exit(1);
}

void Address_print(struct Address *addr)
{
        printf("%d %s %s\n",
               addr->id, addr->name, addr->email);
}

void Database_load(struct Connection *conn)
{
        int rc = fread(conn->db, sizeof(struct Database), 1, conn->file);
        // file read，从文件conn->file中读取数据
        // conn->db是接收数据的起点
        // 读取sizeof(struct Database)个元素
        // 每个元素1个字节
        // 返回实际读取的数据项个数
        if(rc != 1) die("Failed to load database.", conn);
}

struct Connection *Database_open(const char *filename, char mode)
{
        struct Connection *conn = malloc(sizeof(struct Connection));
        if(!conn) die("Memory error", conn);

        conn->db = malloc(sizeof(struct Database));
        if(!conn->db) die("Memory error", conn);

        if(mode == 'c') {
                conn->file = fopen(filename, "w");
                //file open，filename为文件路径，w是模式
                //w 打开只写文件，若文件存在则文件长度清为0，即该文件内容会消失。若文件不存在则建立该文件。
        } else {
                conn->file = fopen(filename, "r+");
                //r+ 以可读写方式打开文件，该文件必须存在。
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
        // 将文件内部的位置指针重新指向一个流（数据流/文件）的开头

        int rc = fwrite(conn->db, sizeof(struct Database), 1, conn->file);
        // conn->db，写入数据的内存起始点，指针
        // sizeof(struct Database)，写入多少数据元素
        // 1，每个数据的字节
        // conn->file，文件流
        // 返回写入数据项个数
        if(rc != 1) die("Failed to write database.", conn);

        rc = fflush(conn->file);
        // 刷新缓冲读写区，清除掉缓冲读写区
        if(rc == -1) die("Cannot flush database.", conn);
}

void Database_create(struct Connection *conn)
{
        int i = 0;

        for(i = 0; i < MAX_ROWS; i++) {
                // make a prototype to initialize it
                struct Address addr = {.id = i, .set = 0};
                // then just assign it
                // 初始化文件，并且用空的数据项填充进去，填充好的话set为1，未填充的set为0
                conn->db->rows[i] = addr;
        }
}

void Database_set(struct Connection *conn, int id, char *name, const char *email)
{
        struct Address *addr = &conn->db->rows[id];
        if(addr->set) die("Already set, delete it first", conn);

        addr->set = 1;
        name[MAX_DATA] = '\0';
        // WARNING: bug, read the "How To Break It" and fix this
        char *res = strncpy(addr->name, name, MAX_DATA);
        // demonstrate the strncpy bug
        // 把addr->name的MAX_DATA个字节复制到name
        // 不足MAX_DATA的话以null填充剩余字节
        // 返回指向addr->name的指针
        if(!res) die("Name copy failed", conn);

        res = strncpy(addr->email, email, MAX_DATA);
        if(!res) die("Email copy failed", conn);
}

void Database_get(struct Connection *conn, int id)
{
        struct Address *addr = &conn->db->rows[id];

        if(addr->set) {
                Address_print(addr);
        } else {
                die("ID is not set", conn);
        }
}

void Database_delete(struct Connection *conn, int id)
{
        struct Address addr = {.id = id, .set = 0};
        conn->db->rows[id] = addr;
}

void Database_list(struct Connection *conn)
{
        int i = 0;
        struct Database *db = conn->db;

        for(i = 0; i < MAX_ROWS; i++) {
                struct Address *cur = &db->rows[i];

                if(cur->set) {
                        Address_print(cur);
                }
        }
}

int main(int argc, char *argv[])
{
        int MAX_ROWS=33;
        int MAX_DATA=34;
        char *filename = argv[1];
        char action = argv[2][0];
        struct Connection *conn = Database_open(filename, action);
        // 先malloc一个空间给文件，然后再malloc一个文件指针
        // 如果是create模式的话，就以只写模式创建文件，如果文件已存在，就覆盖一个空文件
        // 如果是其他模式，就以可读写方式打开文件
        //如果文件已经读取到内存里，就直接从内存读取

        if(argc < 3) die("USAGE: ex17 <dbfile> <action> [action params]", conn);

        int id = 0;

        if(argc > 3) id = atoi(argv[3]);
        // argv[3]在main开头声明是char，在这里需要把字符串转换成int
        if(id >= MAX_ROWS) die("There's not that many records.", conn);

        switch(action) {
                // create，创建数据文件
                case 'c':
                        Database_create(conn);
                        // 初始化并且填充空数据项
                        Database_write(conn);
                        // 重新读取文件
                        break;

                // get，获取数据项
                case 'g':
                        if(argc != 4) die("Need an id to get", conn);

                        Database_get(conn, id);
                        break;

                // set，设置数据项
                case 's':
                        if(argc != 6) die("Need id, name, email to set", conn);

                        Database_set(conn, id, argv[4], argv[5]);
                        // 把数据项的set打个标记
                        // 把数据项复制过去
                        Database_write(conn);
                        // 修改的只是内存里的数据，这里把内存里的数据再写到文件里
                        break;

                // delete，删除数据项
                case 'd':
                        if(argc != 4) die("Need id to delete", conn);

                        Database_delete(conn, id);
                        // 创建一个空的数据项，然后覆盖到要删除的数据项上
                        Database_write(conn);
                        break;

                // list，列出数据项
                case 'l':
                        Database_list(conn);
                        // 按照顺序把数据项print出来
                        break;
                default:
                        die("Invalid action, only: c=create, g=get, s=set, d=del, l=list", conn);
        }

        Database_close(conn);
        // free掉所有东西，包括文件指针，文件，数据项指针

        return 0;
}
