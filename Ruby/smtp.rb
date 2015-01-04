require 'net/smtp'

filename ="v.txt"
filecontent = File.read(filename)
encodedoc = [filecontent].pack("m")
puts "#{filecontent}"
marker = "AUNIQUEMARKER"

msg = <<MSG_END
From: cxh <cxhlmc@126.com>
To: chenxiaohui <cxhlmc@126.com>
Subject: SMTP test
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary = #{marker}

--#{marker}
MSG_END

body = <<EOF
THIS is as test mail with attachment.
EOF

action = <<EOF
Content-Type: text/plain
Content-Transfer-Encoding:8bit

#{body}
--#{marker}
EOF


appendix = <<EOF
Content-Type: multipart/mixed; name=\"#{filename}\"
Content-Transfer-Encoding:base64
Content-Disposition: attachment; filename="#{filename}"

#{encodedoc}
--#{marker}--
EOF

mailtext = msg + action + appendix
#puts "#{encodedoc}"

begin
	Net::SMTP.start('smtp.126.com',
			25,
			'126.com',
			'cxhlmc@126.com','123456',:plain) do |smtp|
		smtp.sendmail(mailtext, 'cxhlmc@126.com',
					['cxhlmc@126.com'])
	end
rescue Exception => e
	print "Exception occured:" + e
end
