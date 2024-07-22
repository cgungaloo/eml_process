import smtplib
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from os.path import basename

def send_email(subject, body, sender, recipients, password, cc,original_xml):
    msg = MIMEMultipart()
    msg['Subject'] = subject
    msg['From'] = sender
    msg['To'] = ', '.join(recipients)
    msg['Cc'] = ', '.join(recipients)

    msg.attach(MIMEText(body))

    with open(original_xml, "rb") as fil:
        part = MIMEApplication(
            fil.read(),
            Name=basename(original_xml)
        )
        # After the file is closed
    part['Content-Disposition'] = 'attachment; filename="%s"' % basename(original_xml)
    msg.attach(part)
    
    with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp_server:
       smtp_server.login(sender, password)
       smtp_server.sendmail(sender, recipients, msg.as_string())
    print("Message sent!")