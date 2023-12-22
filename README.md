# httpX-difference

**Practical difference between http1.1, http2 and http3**

# HTTP/1.1 vs. HTTP/2 Performance Comparison

**Explore the performance differences between HTTP/1.1 and HTTP/2 protocols under simulated slow network conditions.**

## Getting Started

**1. Clone the Repository:**

```bash
git clone https://github.com/SelinJodhani/httpx-difference.git
```

**2. Install Docker:**

- Ensure you have Docker installed on your system. If not, download and install from [https://www.docker.com/](https://www.docker.com/).

**3. Build the Docker Image:**

```bash
docker build -t http-diff .
```

**4. Run the Container:**

```bash
docker run -p 8080:80 -p 4040:443 http-diff
```

**5. Test the Endpoints:**

- Access the HTTP/1.1 endpoint in your browser: `http://localhost:8080`
- Access the HTTP/2 endpoint in your browser: `https://localhost:4040`

**6. Simulate Slow 3G Network:**

- Use browser developer tools to throttle the network speed to "Slow 3G" for both endpoints.
- Observe and compare the loading times and performance metrics.

**Expected Observations:**

- You should notice faster loading times and improved performance with HTTP/2, especially under simulated slow network conditions.

**Additional Notes:**

- This project demonstrates the performance benefits of HTTP/2 in a simplified setup.
- For more comprehensive analysis, consider using dedicated performance testing tools.
- Explore further optimizations for real-world applications.

# Generate SSL Certificates (For testing it locally)

**Here's how to generate a self-signed SSL certificate using OpenSSL:**

**1. Install OpenSSL:**

- If not already installed, download and install OpenSSL from [https://www.openssl.org/](https://www.openssl.org/).

**2. Generate a private key:**

- Open a terminal or command prompt and run:

  ```bash
  openssl genrsa -des3 -out server.key 2048
  ```

- Enter a passphrase when prompted (optional, but recommended for security).

**3. Create a Certificate Signing Request (CSR):**

- Run:

  ```bash
  openssl req -new -key server.key -out server.csr
  ```

- Provide information like country, state, city, organization, domain name, etc.

**4. Generate the self-signed certificate:**

- Run:

  ```bash
  openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
  ```

- This creates a certificate valid for 365 days. Adjust as needed.

**5. (Optional) Remove passphrase from the key (if set):**

- If you want to automate certificate usage without manual passphrase entry:

  ```bash
  openssl rsa -in server.key -out server.key.unsecure
  ```

**Key files generated:**

- `server.key`: The private key (keep this secure!).
- `server.crt`: The self-signed certificate.

**Using the certificate:**

- Configure your web server (e.g., Nginx, Apache) to use the certificate and key files.
- Note that browsers will display security warnings for self-signed certificates, as they aren't trusted by default.

**For production environments:**

- It's strongly recommended to obtain certificates from trusted Certificate Authorities (CAs) for better security and browser trust.
