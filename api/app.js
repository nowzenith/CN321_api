const express = require('express');
const app = express();
app.use(express.json());

const PORT = 54321;

const faculties = [
    { id: '01', name: 'คณะนิติศาสตร์' },
    { id: '02', name: 'คณะพาณิชยศาสตร์และการบัญชี' },
    { id: '03', name: 'คณะรัฐศาสตร์' },
    { id: '04', name: 'คณะเศรษฐศาสตร์' },
    { id: '05', name: 'คณะสังคมสงเคราะห์ศาสตร์' },
    { id: '06', name: 'คณะศิลปศาสตร์' },
    { id: '07', name: 'คณะวารสารศาสตร์และสื่อสารมวลชน' },
    { id: '08', name: 'คณะสังคมวิทยาและมานุษยวิทยา' },
    { id: '09', name: 'คณะวิทยาศาสตร์และเทคโนโลยี' },
    { id: '10', name: 'คณะวิศวกรรมศาสตร์' },
    { id: '11', name: 'คณะแพทยศาสตร์' },
    { id: '12', name: 'คณะสหเวชศาสตร์' },
    { id: '13', name: 'คณะทันตแพทยศาสตร์' }
  ];

// Mock user database
const users = [
    { id: 1, username: 'admin', password: 'admin123', fullName: 'Admin Admin' },
    { id: 2, username: '6310742207', password: '12345', fullName: 'นาย a' },
    { id: 3, username: '6410472207', password: '12345', fullName: 'นาย b' },
    { id: 4, username: '6301742207', password: '12345', fullName: 'นาย c' },
    { id: 5, username: '6311742207', password: '12345', fullName: 'นาย d' },
];

const news = [
    {
        "id": 1,
        "title": "“ในหลวง-พระราชินี” พระราชทาน\nปริญญาบัตร\nมหาวิทยาลัยธรรมศาสตร์",
        "summary": "สาขาวิชาวิศวกรรมซอฟต์แวร์ (Soft-en)",
    },
    {
        "id": 2,
        "title": "“ในหลวง-พระราชินี” พระราชทาน\nปริญญาบัตร\nมหาวิทยาลัยธรรมศาสตร์",
        "summary": "สาขาวิชาวิศวกรรมซอฟต์แวร์ (Soft-en)",
    },
    {
        "id": 3,
        "title": "“ในหลวง-พระราชินี” พระราชทาน\nปริญญาบัตร\nมหาวิทยาลัยธรรมศาสตร์",
        "summary": "สาขาวิชาวิศวกรรมซอฟต์แวร์ (Soft-en)",
    },
    {
        "id": 4,
        "title": "“ในหลวง-พระราชินี” พระราชทาน\nปริญญาบัตร\nมหาวิทยาลัยธรรมศาสตร์",
        "summary": "สาขาวิชาวิศวกรรมซอฟต์แวร์ (Soft-en)",
    },
    {
        "id": 5,
        "title": "“ในหลวง-พระราชินี” พระราชทาน\nปริญญาบัตร\nมหาวิทยาลัยธรรมศาสตร์",
        "summary": "สาขาวิชาวิศวกรรมซอฟต์แวร์ (Soft-en)",
    }
]


app.get('/status', (req, res) => {
    const token = req.headers['authorization'];
    if (token === 'test-api') {
        res.status(200).json({ success: true, Status: 'Running' });
    } else {
        res.status(401).json({
            message: 'Unauthorized'
        });
    }
});

app.get('/news', (req, res) => {
    const token = req.headers['authorization'];
    if (token === 'test-api') {
        res.status(200).json({ success: true, data: news });
    } else {
        res.status(401).json({
            message: 'Unauthorized'
        });
    }
});

app.post('/login', (req, res) => {
    const token = req.headers['authorization'];
    const { username, password } = req.body;
    console.log(username, password, token);
    if (token === 'test-api') {
        if (username === undefined || password === undefined) {
            const loginFailResponse = {
                success: false,
                message: 'Login failed: Invalid username or password'
            };
            res.status(401).json(loginFailResponse);
        }
        else {
            const facultyRegex = /^(.{2})(01|02|03|04|05|06|07|08|09|10|11|12|13)/;
            if (username.length == 10 && facultyRegex.test(username)) {
                const faculty = faculties.find(f => f.id === username.substring(2, 4));
                const user = users.find(u => u.username === username && u.password === password);
                if (user) {
                    const loginSuccessResponse = {
                        success: true,
                        message: 'Login successful',
                        data: {
                            userId: user.id,
                            username: user.username,
                            fullName: user.fullName,
                            faculties: faculty.name
                        }
                    };
                    res.status(200).json(loginSuccessResponse);
                } else {
                    const loginFailResponse = {
                        success: false,
                        message: 'Login failed: Invalid username or password'
                    };
                    res.status(401).json(loginFailResponse);
                }
            }
            else {
                const loginFailResponse = {
                    success: false,
                    message: 'Login failed: Username does not meet the required conditions'
                };
                res.status(401).json(loginFailResponse);
            }
        }
    }
    else {
        res.status(401).json({
            message: 'Unauthorized'
        });
    }
});

app.listen(PORT, () => {
    console.log(`Server Listening on http://localhost:${PORT}`);
});