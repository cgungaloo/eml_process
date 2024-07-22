import xml.etree.ElementTree as ET
from email_outlook import send_email

root = ET.parse('sensitive_email.xml').getroot()

var_map = {
    'From':None,
    'To':None,
    'Date':None,
    'Subject':None,
    'message':None
}

for type_tag in root.findall('p'):
    content = type_tag.text
    if content is not None:
        key = content.split(':')[0]
        val = content.split(':')[1].lstrip()
        if key in var_map:
            var_map[key] = val
        elif var_map['message'] is None:
            var_map['message'] = val
        else:
            var_map['message'] = var_map['message'] + content

var_map['message'] = var_map['message'] + "\n\n Email data \n"
var_map['message'] = var_map['message'] + var_map['From']
var_map['message'] = var_map['message'] + var_map['To']
var_map['message'] = var_map['message'] + var_map['Date']
var_map['message'] = var_map['message'] + var_map['Subject']

send_email('subject','message','from','recipients_as_list','smtp_pwd','Cc as list','attachement_file_relative_path')
