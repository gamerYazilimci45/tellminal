import socket
import sys

def start_server(host, port):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((host, port))
    server_socket.listen(5)
    print("Server started, connect is waiting...")

    client_socket, addr = server_socket.accept()
    print(f"Connected: {addr}")

    while True:
        message = client_socket.recv(1024).decode('utf-8')
        if message.lower() == 'exit':
            print("Connect closed.")
            break
        print(f"Incoming message : {message}")
        response = input("Reply: ")
        client_socket.send(response.encode('utf-8'))
        

    client_socket.close()
    server_socket.close()

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("[!] Error 1")
        sys.exit(1)
    host = sys.argv[1]
    port = int(sys.argv[2])
    start_server(host, port)
