import * as http from 'http';

const host = 'localhost';
const port = 1337;

const server = http.createServer((_: http.IncomingMessage, res: http.ServerResponse) => {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Hi, this is your code running.\n');
});

server.listen(port, host, () => { console.log(`Server running at ${host}:${port}`); });
