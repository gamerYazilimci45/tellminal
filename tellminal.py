#!/usr/bin/env python3
import sys
import server
import client

def run_server(host, port):
    server.start_server(host, port)

def run_client(host, port):
    client.start_client(host,port)

def main():
    if len(sys.argv) != 4:
        print("Usage: tellminal <server/client> <host> <port>")
        sys.exit(1)

    mode = sys.argv[1].lower()
    host = sys.argv[2]
    port = int(sys.argv[3])

    if mode == "server":
        run_server(host, port)
    elif mode == "client":
        run_client(host, port)
    else: 
        print(f"Unknown option: {mode}")
        sys.exit(1)

if __name__ == "__main__":
    main()