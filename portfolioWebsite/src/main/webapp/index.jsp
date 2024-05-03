<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blake Moore</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: #fff;
        }
        .container {
            width: 90%;
            margin: 20px auto 0;
            padding: 20px;
            background-color: #1e1e1e;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
        }
        h1 {
            text-align: center;
            color: #fff;
            font-size: 36px;
            margin-bottom: 20px;
        }
        .tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .tab {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 10px;
            transition: background-color 0.3s ease;
            font-size: 18px;
        }
        .tab:hover {
            background-color: #0056b3;
        }
        .tab.active {
            background-color: #0056b3;
        }
        .content {
            padding: 20px;
            border-radius: 8px;
            background-color: #222;
            margin-bottom: 20px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 8px;
        }
        .button:hover {
            background-color: #45a049;
        }

        /* Media queries for mobile */
        @media screen and (max-width: 600px) {
            .container {
                width: 100%;
            }
            .tab {
                font-size: 16px;
            }
            h1 {
                font-size: 24px;
            }
        }
        a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        /* Change link color on hover */
        a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Blake Moore</h1>

    <div class="tabs">
        <div class="tab active" onclick="showAboutMe()">About Me</div>
        <div class="tab" onclick="showPortfolio()">Portfolio</div>
        <div class="tab" onclick="showResume()">Resume</div>
        <div class="tab" onclick="showContact()">Contact Me</div>
    </div>

    <div class="content" id="aboutMeContent">
        <h2>About Me</h2>
        <p>My name is Blake Moore, and I am a software engineering student currently
            working on my Master's degree at Auburn University. I graduated with my
            Bachelor's degree in December 2023. My work experience includes three
            terms of a CO-OP at McLeod Software and my current internship at
            Alabama Power. At McLeod Software I was a part of the Custom
            Programming Group responsible for making custom modifications
            to our product to tailor it to customer requests. I was also
            responsible for debugging and fixing issues in our Java source code
            when needed. At Alabama Power I am a part of the Power Delivery Data
            Analytics team. My team was responsible for evaluating strategic decisions
            using data analysis to improve company reliability and efficiency. I personally
            wrote new pieces of software to compile and analyze company data.</p> <br>
        <p>You can see my previous coursework by navigating to the "Portfolio" tab.
            My resume can be found my navigating to the "Resume" tab. You can also contact me
            at either the email or phone number in the "Contact Me" tab.</p>
    </div>

    <div class="content" id="portfolioContent" style="display: none;">
        <!-- Portfolio content will be loaded here -->
        <h2>Portfolio</h2>
        <p>Check out some of my past projects!</p>
        <button class="button" onclick="viewPortfolio()">View Portfolio</button>
    </div>

    <div class="content" id="resumeContent" style="display: none;">
        <h2>Resume</h2>
        <p>Take a look at my resume to learn more about my skills and experiences.</p>
        <button class="button" onclick="viewResume()">View Resume</button>
    </div>

    <div class="content" id="contactContent" style="display: none;">
        <h2>Contact Me</h2>
        <p><strong>Email:</strong> bmm0066@auburn.edu</p>
        <p><strong>Phone:</strong> 205-777-1518</p>
        <button class="button" onclick="sendMessage()">Send Message</button>
    </div>

    <script>
        function showAboutMe() {
            document.getElementById("aboutMeContent").style.display = "block";
            document.getElementById("portfolioContent").style.display = "none";
            document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
            document.querySelector('.tab:nth-child(1)').classList.add('active');
        }

        function showPortfolio() {
            document.getElementById("aboutMeContent").style.display = "none";
            document.getElementById("portfolioContent").style.display = "block";
            document.getElementById("portfolioContent").innerHTML = `
                <h2>Past Work</h2>
                <form action="PortfolioServlet" method="post">
                    <button type="submit" class="button" name="Portfolio">See Portfolio</button>
                </form>
            `;
            document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
            document.querySelector('.tab:nth-child(2)').classList.add('active');
        }

        function showResume() {
            document.getElementById("aboutMeContent").style.display = "none";
            document.getElementById("portfolioContent").style.display = "block";
            document.getElementById("portfolioContent").innerHTML = `
                <h2>Resume</h2>
                <form action="ResumeServlet" method="post">
                    <button type="submit" class="button" name="Resume">See Resume</button>
                </form>
            `;
            document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
            document.querySelector('.tab:nth-child(3)').classList.add('active');
        }

        function showContact() {
            document.getElementById("aboutMeContent").style.display = "none";
            document.getElementById("portfolioContent").style.display = "block";
            document.getElementById("portfolioContent").innerHTML = `
                <h2>Contact Me</h2>
                <p><strong>Email:</strong> <a href="mailto:bmm0066@auburn.edu">bmm0066@auburn.edu</a></p>
                <p><strong>Phone:</strong> <a href="tel:+12057771518">205-777-1518</a></p>
            `;
            document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
            document.querySelector('.tab:nth-child(4)').classList.add('active');
        }

        // Show About Me tab by default
        showAboutMe();
    </script>
</div>
</body>
</html>

