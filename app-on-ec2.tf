resource "aws_instance" "my_ec2" {
  ami           = "ami-05b10e08d247fb927"  # Provided AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = "mytf-key"  # Use the manually created key

  # Use the existing security group
  vpc_security_group_ids = ["sg-054cd64a2f0d9d992"]
/*
 # Use the default security group
  vpc_security_group_ids = [data.aws_security_group.default.id]
*/
  associate_public_ip_address = true  # Assign a public IP

  root_block_device {
    volume_size           = 10
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  # User Data to Install Apache and Display Server Details
  user_data = <<-EOF
   #!/bin/bash
    # Update system and install Apache
    yes | sudo yum update -y
    yes | sudo yum install httpd -y
    
    # Start and enable Apache
    sudo systemctl start httpd
    sudo systemctl enable httpd
    
    # Create an HTML file
    cat <<EOL > /var/www/html/index.html
    <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
    />
    <title>Make a Website Using HTML/CSS</title>
  </head>
  <body>
    <header>
      <!-- Navbar -->
      <nav id="navbar">
        <div class="container">
          <h1><a href="#">Ping4Learning</a></h1>
          <ul>
            <li><a href="index.html" class="current">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="contact.html">Contact</a></li>
          </ul>
        </div>
      </nav>
      <!-- Showcase Area -->
      <div id="showcase">
        <div class="container">
          <div class="showcase-content">
            <h2>The Learning platform</h2>
            <p class="lead">
              "ping4learning" is all about to learn new things everyday.
                <li>1. It’s never too late to start something new, to do all those things that you’ve been longing to do. – Harsh Vardhan Yadav</li>
                <li>2. It’s never too late to give up what you are doing and start doing what you realize you love. – Neeraj Kumar</li>
                <li>3. It’s never too late to make things right.</li>
                <li>4. It’s never too late to follow your dreams, and there’s no time like the present to start.</li>

                <li>Please start to learn from today only. </li>
              
            </p>
            <a href="#" class="btn">Read More</a>
          </div>
        </div>
      </div>
    </header>

    <!-- About Section -->
    <section class="about">
      <div class="container">
        <h3 class="bg-dark-line"><span>About Us</span></h3>
        <p class="lead">
          <Li>The Ping4Learning community is a group of people:
 
            <li>Who will exchange there knowledge based upon</li>
            <li>Professional experience,</li>
            <li>New Technology </li>
            <li>Academic research </li>
            </Li>
        </p>
        <p class="lead">
          <h1>What are the benefit to join this community?</h1>
          <li>Give and Receive Support, Motivation, and Inspiration</li>

            <li>Kick start your career</li>

            <li>Build and Grow Your Professional network</li>

            <li>li>Make Real-World connections.</li>

            <li>li>Work Together to Make Positive Change</li>

            <li>li>Stay up to date with what’s going on in your industry</li>

            <li>li>Benchmark your knowledge with peers</li>

            <li>li>Joining a community can help you understand where you are on your career path</li>

        </p>
      </div>
    </section>
    <!-- Our Services -->
    <div id="services">
      <div class="container">
        <h3 class="bg-dark-line"><span>Services</span></h3>
        <div class="box bg-primary">
          <h2>Web Designing</h2>
          <i class="fa-solid fa-paintbrush fa-4x"></i>
          <p class="lead">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquam iusto, pariatur sint
            culpa vero impedit ex tenetur doloremque, nihil corrupti, amet soluta? Earum, quidem
            culpa.
          </p>
        </div>
        <div class="box light-gray">
          <h2>Web Development</h2>
          <i class="fa-solid fa-code fa-4x"></i>
          <p class="lead">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquam iusto, pariatur sint
            culpa vero impedit ex tenetur doloremque, nihil corrupti, amet soluta? Earum, quidem
            culpa.
          </p>
        </div>
        <div class="box bg-primary">
          <h2>Desktop Application</h2>
          <i class="fa-solid fa-desktop fa-4x"></i>
          <p class="lead">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquam iusto, pariatur sint
            culpa vero impedit ex tenetur doloremque, nihil corrupti, amet soluta? Earum, quidem
            culpa.
          </p>
        </div>
      </div>
    </div>

    <div class="clr"></div>

    <!--- Author -->
    <!--
      <div class="container">
        <h3><span>Authors</span></h3>
        <div class="auth">
          <img src="./img/Authors/person1.png" alt="" />
          <p class="names">John Doe</p>
          <p>Admin</p>
          <p class="lead">
            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorem aut quod, earum
            quaerat eveniet doloribus quasi nam est illo reiciendis fugiat sit blanditiis omnis
            cumque quos error temporibus quisquam eligendi?
          </p>
        </div>
        <div class="auth">
          <img src="./img/Authors/person4.png" alt="" />
          <p class="names">Suzi</p>
          <p>Manager</p>
          <p class="lead">
            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorem aut quod, earum
            quaerat eveniet doloribus quasi nam est illo reiciendis fugiat sit blanditiis omnis
            cumque quos error temporibus quisquam eligendi?
          </p>
        </div>
        <div class="auth">
          <img src="./img/Authors/person3.png" alt="" />
          <p class="names">Jason</p>
          <p>Accountant</p>
          <p class="lead">
            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorem aut quod, earum
            quaerat eveniet doloribus quasi nam est illo reiciendis fugiat sit blanditiis omnis
            cumque quos error temporibus quisquam eligendi?
          </p>
        </div>
      </div>
    </div>
    -->

    <!-- Contact -->
    <div id="contact">
      <div class="container">
        <h3><span>Contact Us</span></h3>
        <div class="contact-form">
          <form action="process.php">
            <div class="form-group">
              <label for="name">Name</label>
              <input type="text" name="name" />
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" name="name" />
            </div>
            <div class="form-group">
              <label for="message">Message</label>
              <textarea name="message" id="message" cols="30" rows="10"></textarea>
            </div>
            <button type="button" class="btn">Submit</button>
          </form>
        </div>
      </div>
    </div>
    <footer id="main-footer">
      <div class="container">
        <p>
          The Hub of Technology Design by
          <a href="https://onlineittuts.com"> OnlineITtuts </a> &copy 2022
        </p>
      </div>
    </footer>
  </body>
</html>

    EOL
    
    # Create a CSS file
    cat <<EOL > /var/www/html/style.css
    @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body{
    font-family: 'Poppins';
    line-height: 1.7em;

}

a{
    text-decoration: none;
    color: #fff;
}

.container{
    max-width: 1100px;
    margin:auto;
}

.lead{
    font-size: 16px;
    padding: 10px 10px;
    text-align: justify;
}

.btn{
    display: inline-block;
    padding: 07px 16px;
    background: rgb(38, 94, 222);;
    border: none;
    cursor: pointer;
    font-size: 16px;
    border-radius: 03px;
    color:#fff;
    transition: all 0.3;
}

.clr{
    clear: both;
}

/* Close Utality Classes */

#navbar{
    background: #3170ff;
    overflow: auto;
}

#navbar h1{
    float: left;
    padding-top: 20px;
}

#navbar ul{
    list-style: none;
    float: right;
}

#navbar ul li{
    float: left;
}

#navbar ul li a{
    display: block;
    padding: 20px;
    text-align: center;
    transition: all 0.5s;
}

#navbar ul li a:hover,
#navbar ul li a.current{
    background: #4397EA;
    transition: all 0.5s;
}

/* Showcase Area */
#showcase{
    background: url('../img/img2.jpg') no-repeat
    center center/cover;
    height: 400px;
    color: #fff;
}

.showcase-content{
    padding-top: 50px;
    color: #333;
}

.showcase-content h2{
   font-size: 60px;
   line-height: 1.9em;
 }

 .showcase-content p{
    font-size: 20px;
    margin-bottom: 20px;
 }

 .showcase-content .btn:hover{
    background: #4397EA;
    border: none;
    color:#fff;
    transition: all 0.3s;
 }

/* About Section */

 .about{
    height: 550px;
    margin-top: 80px;
 }

 .about h3{
    width: 100%;
    border-bottom: 2px solid  #ddd;
 }

 .about h3 span{
    background:  #ddd;;
    padding: 10px 22px;
    color: #333;
    text-align: center;
    display: inline-block;
 }
/* Close */


#services h3{
    width: 100%;
    border-bottom: 0.5px solid #ddd;;
 }

#services h3 span{
    background: #ddd;
    padding: 10px 22px;
    color: #333;
    text-align: center;
    display: inline-block;
 }

 #services .box{
    float: left;
    width: 33.33%;
    padding: 45px;
    text-align: center;
    margin: 30px 0px;
 }

 .bg-primary{
 background: #265ede;
    color: #fff;
 }

 .light-gray{
    background: #ddd;
 }

 #services h2{
  margin-bottom: 25px;
 }

/* Author */

#authors h3{
    width: 100%;
    border-bottom: 0.5px solid #ddd;;
 }

 #authors h3 span{
    background: #ddd;
    padding: 10px 22px;
    color: #333;
    text-align: center;
    display: inline-block;
 }

#authors{
    background: url('../img/img.jpg') no-repeat center;
    height: 600px;
    padding-top: 40px ;

 }

.auth{
    float: left;
    height: 500px;
    width: 33%;
    color: #fff;
    padding: 20px;
    text-align: center;
    margin: 20px 01px;
}

.auth img{
    border-radius: 50%;
}

.names{
    font-weight: bold;
    font-size: 18px;
}

/* Contact Us */
#contact h3{
    width: 100%;
    border-bottom: 0.5px solid #ddd;;
    margin-bottom: 35px;
}

#contact h3 span{
    background: #ddd;
    padding: 10px 22px;
    color: #333;
    text-align: center;
    display: inline-block;
}

#contact .form-group{
    margin-bottom: 20px;
}

.contact-form label{
    display: block;
    margin-bottom: 5px;
}

.contact-form input{
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
}

#contact textarea{
    height: 200px;
    width: 100%;
}

.contact-form input:focus,
.contact-form textarea:focus{
    outline: none;
    border-color: #265ede;
}


/* Footer */

#main-footer{
    background: #265ede;
    padding: 20px;
    margin-top: 20px;
    text-align: center;
    color:#fff;
}

    EOL
    
    # Restart Apache to load new files
    sudo systemctl restart httpd
  EOF

  tags = {
    Name = "MyPublicEC2"
  }
}