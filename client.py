import socket
import sys

def start_client(host, port):
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((host, port)) 

    print("The server is connected. Start typing to send a message. Type 'exit' to exit.")
    
    while True:
        message = input("Send message: ")
        client_socket.send(message.encode('utf-8'))
        if message.lower() == 'exit':
            print("Connect closed.")
            break
        response = client_socket.recv(1024).decode('utf-8')
        print(f"Incoming message: {response}")
        

    client_socket.close()

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Error 1")
        sys.exit(1)

    host = sys.argv[1]
    port = int(sys.argv[2])
    start_client(host, port)
