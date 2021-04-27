#!/usr/bin/env python3

from PyPDF2 import PdfFileWriter, PdfFileReader
import io
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
from reportlab.lib.units import mm

print(mm)

packet = io.BytesIO()
# create a new PDF with Reportlab

can = canvas.Canvas(packet, pagesize=A4)
can.setFont("Courier-Bold", 12)

def write_string(x, y, v):
    can.drawString(x * mm, y * mm, v)

def space_string(x, y, dx, v):
    for i in range(0, len(v)):
        can.drawString((x + dx * i) * mm, y * mm, v[i])

write_string(76, 208, "Company name")
space_string(148, 199.5, 5.4, "12345678")
space_string(137, 190.5, 5.4, "9876543210")
space_string(181, 182, 5.4, "06")

write_string(72.2, 155.4, "A")
write_string(186.2, 155.4, "B")
write_string(72.2, 146.5, "C")
write_string(186.2, 146.5, "D")

space_string(23.5, 108, 5.4, "**")
space_string(37, 108, 5.4, "**")
space_string(50.5, 108, 5.4, "****")

space_string(143, 108, 5.4, "**")
space_string(156.5, 108, 5.4, "**")
space_string(170, 108, 5.4, "****")

write_string(186.2, 89.5, "Z")
write_string(186.2, 81.0, "Y")
write_string(186.2, 72.5, "X")
write_string(186.2, 64, "W")
write_string(186.2, 55.5, "V")
write_string(186.2, 47, "U")
write_string(186.2, 29, "T")
write_string(186.2, 20.5, "S")

for x in range(0, 40):
    for y in range(0, 40):
        pass
#        write_string(x * 5, y * 5, str((x + y) % 10))



can.save()

#move to the beginning of the StringIO buffer
packet.seek(0)
new_pdf = PdfFileReader(packet)
# read your existing PDF
existing_pdf = PdfFileReader(open("CT600_2021.pdf", "rb"))
output = PdfFileWriter()
# add the "watermark" (which is the new pdf) on the existing page
page = existing_pdf.getPage(0)
page.mergePage(new_pdf.getPage(0))
output.addPage(page)
# finally, write "output" to a real file
outputStream = open("destination.pdf", "wb")
output.write(outputStream)
outputStream.close()

