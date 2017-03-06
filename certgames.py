import ssl
import OpenSSL
import sys

if len(sys.argv) < 2:
    sys.exit(0)
if type(sys.argv[1]) is not str:
    print sys.argv[1]

hostname = sys.argv[1]
port = 443

cert = ssl.get_server_certificate((hostname, port))
x509 = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_PEM, cert)
pkey = x509.get_pubkey()

# cryptography.hazmat.primitives.asymmetric.rsa.RSAPublicKey
pubkey = pkey.to_cryptography_key()
pubnum = pubkey.public_numbers()
n = pubnum.n
e = pubnum.e

print 'n', n
print 'e', e

if 'writefile' in sys.argv:
    der = OpenSSL.crypto.dump_certificate(OpenSSL.crypto.FILETYPE_ASN1, x509)
    with open('certs/'+hostname, 'wb') as f:
        f.write(der)
        f.close()