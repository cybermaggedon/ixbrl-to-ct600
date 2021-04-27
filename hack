#!/usr/bin/env python3

# CT form is at
# https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/938641/CT600_2021.pdf

from PyPDF2 import PdfFileWriter, PdfFileReader
import io
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
from reportlab.lib.units import mm

buffer = io.BytesIO()

can = canvas.Canvas(buffer, pagesize=A4)
can.setFont("Courier-Bold", 12)

def write_string(x, y, v):
    can.drawString(x * mm, y * mm, v)

def space_string(x, y, dx, v):
    for i in range(0, len(v)):
        can.drawString((x + dx * i) * mm, y * mm, v[i])

write_string(76, 208, "Company name")
space_string(148, 199.5, 5.47, "12345678")
space_string(137, 190.5, 5.47, "9876543210")
space_string(181, 182, 5.47, "06")

write_string(72.2, 155.4, "A")
write_string(186.2, 155.4, "B")
write_string(72.2, 146.5, "C")
write_string(186.2, 146.5, "D")

space_string(23.5, 108, 5.47, "00")
space_string(37, 108, 5.47, "00")
space_string(50.5, 108, 5.47, "0000")

space_string(143, 108, 5.47, "00")
space_string(156.5, 108, 5.47, "00")
space_string(170, 108, 5.47, "0000")

write_string(186.2, 89.5, "Z")
write_string(186.2, 81.0, "Y")
write_string(186.2, 72.5, "X")
write_string(186.2, 64, "W")
write_string(186.2, 55.5, "V")
write_string(186.2, 47, "U")
write_string(186.2, 29, "T")
write_string(186.2, 20.5, "S")

can.showPage()

can.setFont("Courier-Bold", 12)

write_string(186.2, 265.5, "X")
write_string(186.2, 257, "X")
write_string(26, 240.5, "<REASON GOES HERE>")
write_string(186, 223, "X")
write_string(186, 214.5, "X")
write_string(186, 206.5, "X")
write_string(186, 197, "X")
write_string(186, 188.5, "X")
write_string(186, 179.5, "X")
write_string(186, 170.5, "X")
write_string(186, 161.5, "X")
write_string(186, 153.5, "X")
write_string(186, 144.5, "X")
write_string(186, 136, "X")
write_string(186, 127, "X")
space_string(79, 101, 5.5, "999999999999999999")

write_string(186, 92, "X")

space_string(117.5, 68.7, 5.5, "99999999999")
space_string(117.5, 57, 5.5, "99999999999")
space_string(117.5, 46, 5.5, "99999999999")
space_string(117.5, 34.5, 5.5, "99999999999")

write_string(186.2, 19, "X")

can.showPage()

can.setFont("Courier-Bold", 12)
space_string(117.5, 270.5, 5.5, "99999999999")
space_string(117.5, 254.5, 5.5, "99999999999")
space_string(118, 238.5, 5.5, "99999999999")
space_string(118, 227.5, 5.5, "99999999999")
space_string(118, 216.5, 5.5, "99999999999")
space_string(118, 204.5, 5.5, "99999999999")
space_string(118, 193.5, 5.5, "99999999999")
space_string(118, 171.5, 5.5, "99999999999")
space_string(118, 160.5, 5.5, "99999999999")
space_string(118, 148.5, 5.5, "99999999999")

space_string(118, 126, 5.5, "99999999999")
space_string(118, 114.5, 5.5, "99999999999")

space_string(118, 94.5, 5.5, "99999999999")

space_string(118, 71.5, 5.5, "99999999999")
space_string(118, 60.5, 5.5, "99999999999")
space_string(118, 49, 5.5, "99999999999")

space_string(118, 33.5, 5.5, "99999999999")

space_string(118, 17.5, 5.5, "99999999999")

can.showPage()
can.setFont("Courier-Bold", 12)

space_string(117.5, 265.5, 5.5, "99999999999")
space_string(117.5, 257, 5.5, "99999999999")
space_string(117.5, 248.5, 5.5, "99999999999")

write_string(186, 240, "X")

space_string(117.5, 228, 5.5, "99999999999")
space_string(117.5, 219, 5.5, "99999999999")
space_string(117.5, 211, 5.5, "99999999999")

space_string(117.5, 198, 5.5, "99999999999")
space_string(117.5, 186, 5.5, "99999999999")
space_string(117.5, 177.5, 5.5, "99999999999")
space_string(117.5, 169.5, 5.5, "99999999999")
space_string(117.5, 161, 5.5, "99999999999")
space_string(117.5, 147, 5.5, "99999999999")
space_string(117.5, 138.5, 5.5, "99999999999")

write_string(32, 93, "2020")
write_string(32, 68, "2021")

write_string(68, 93, "999999")
write_string(68, 84.4, "999999")
write_string(68, 76, "999999")

write_string(128, 93, "19")
write_string(128, 84.4, "19")
write_string(128, 76, "19")

write_string(68, 68, "999999")
write_string(68, 60, "999999")
write_string(68, 52, "999999")

write_string(128, 68, "19")
write_string(128, 60, "19")
write_string(128, 52, "19")

write_string(162, 93, "99999.99")
write_string(162, 84.4, "99999.99")
write_string(162, 76, "99999.99")

write_string(162, 68, "99999.99")
write_string(162, 60, "99999.99")
write_string(162, 52, "99999.99")

space_string(117.5, 37, 5.5, "99999999999")
space_string(181, 37, 5.5, "99")

space_string(117.5, 28.5, 5.5, "99999999999")
space_string(180.5, 28.5, 5.5, "99")

space_string(117.5, 19.5, 5.5, "99999999999")
space_string(180.5, 19.5, 5.5, "99")

can.showPage()
can.setFont("Courier-Bold", 12)

space_string(117.5, 271, 5.5, "99999999999")
space_string(180.5, 271, 5.5, "99")

space_string(117.5, 262.2, 5.5, "99999999999")
space_string(180.5, 262.2, 5.5, "99")

write_string(186, 254, "X")
write_string(186, 243, "X")

space_string(117.5, 232, 5.5, "99999999999")
space_string(180.5, 232, 5.5, "99")

space_string(117.5, 223, 5.5, "99999999999")
space_string(180.5, 223, 5.5, "99")

space_string(117.5, 197, 5.5, "99999999999")
space_string(180.5, 197, 5.5, "99")

space_string(117.5, 189, 5.5, "99999999999")
space_string(180.5, 189, 5.5, "99")

space_string(117.5, 180.5, 5.5, "99999999999")
space_string(180.5, 180.5, 5.5, "99")

space_string(117.5, 172, 5.5, "99999999999")
space_string(180.5, 172, 5.5, "99")

space_string(117.5, 145.5, 5.5, "99999999999")
space_string(180.5, 145.5, 5.5, "99")

space_string(117.5, 134, 5.5, "99999999999")
space_string(180.5, 134, 5.5, "99")

write_string(186, 123.5, "X")

space_string(117.5, 111, 5.5, "99999999999")
space_string(180.5, 111, 5.5, "99")

space_string(117.5, 100, 5.5, "99999999999")
space_string(180.5, 100, 5.5, "99")

space_string(117.5, 89.5, 5.5, "99999999999")
space_string(180.5, 89.5, 5.5, "99")

space_string(117.5, 78, 5.5, "99999999999")
space_string(180.5, 78, 5.5, "99")

space_string(117.5, 64, 5.5, "99999999999")
space_string(180.5, 64, 5.5, "99")

space_string(117.5, 54.5, 5.5, "99999999999")
space_string(180.5, 54.5, 5.5, "99")

space_string(117.5, 45.5, 5.5, "99999999999")
space_string(180.5, 45.5, 5.5, "99")

space_string(117.5, 34.5, 5.5, "99999999999")
space_string(180.5, 34.5, 5.5, "99")

space_string(117.5, 24.5, 5.5, "99999999999")
space_string(180.5, 24.5, 5.5, "99")

can.showPage()
can.setFont("Courier-Bold", 12)

space_string(117.5, 270, 5.5, "99999999999")
space_string(180.5, 270, 5.5, "99")

space_string(117.5, 254.5, 5.5, "99999999999")
space_string(180.5, 254.5, 5.5, "99")

space_string(117.5, 242.5, 5.5, "99999999999")
space_string(180.5, 242.5, 5.5, "99")

space_string(117.5, 216.5, 5.5, "99999999999")
space_string(180.5, 216.5, 5.5, "99")

space_string(117.5, 196.5, 5.5, "99999999999")
space_string(180.5, 196.5, 5.5, "99")

space_string(117.5, 186, 5.5, "99999999999")
space_string(180.5, 186, 5.5, "99")

space_string(117.5, 171, 5.5, "99999999999")
space_string(180.5, 171, 5.5, "99")

space_string(117.5, 160.5, 5.5, "99999999999")
space_string(180.5, 160.5, 5.5, "99")

space_string(117.5, 151, 5.5, "99999999999")
space_string(180.5, 151, 5.5, "99")

space_string(117.5, 136, 5.5, "99999999999")
space_string(180.5, 136, 5.5, "99")

space_string(117.5, 124.5, 5.5, "99999999999")
space_string(180.5, 124.5, 5.5, "99")

space_string(117.5, 109.5, 5.5, "99999999999")
space_string(180.5, 109.5, 5.5, "99")

space_string(117.5, 94.5, 5.5, "99999999999")
space_string(180.5, 94.5, 5.5, "99")

space_string(117.5, 79.5, 5.5, "99999999999")
space_string(180.5, 79.5, 5.5, "99")

space_string(117.5, 69.5, 5.5, "99999999999")
space_string(180.5, 69.5, 5.5, "99")

space_string(117.5, 59, 5.5, "99999999999")
space_string(180.5, 59, 5.5, "99")

space_string(117.5, 48.8, 5.5, "99999999999")
space_string(180.5, 48.8, 5.5, "99")

space_string(117.5, 38.2, 5.5, "99999999999")
space_string(180.5, 38.2, 5.5, "99")

space_string(117.5, 23, 5.5, "99999999999")
space_string(180.5, 23, 5.5, "99")

can.showPage()
can.setFont("Courier-Bold", 12)

space_string(117.5, 271, 5.5, "99999999999")
space_string(180.5, 271, 5.5, "99")

space_string(117.5, 261, 5.5, "99999999999")
space_string(180.5, 261, 5.5, "99")

space_string(117.5, 236, 5.5, "99999999999")

write_string(175, 226, "13")

write_string(186, 206.5, "X")
write_string(186, 192, "X")
write_string(186, 178, "X")
write_string(186, 168, "X")
write_string(186, 158, "X")

space_string(117.5, 147.5, 5.5, "99999999999")

write_string(186.2, 115.5, "X")
write_string(186.2, 100.5, "X")

space_string(117.5, 91, 5.5, "99999999999")

space_string(117.5, 80.5, 5.5, "99999999999")
space_string(117.5, 70.5, 5.5, "99999999999")

space_string(117.5, 56, 5.5, "99999999999")
space_string(117.5, 42, 5.5, "99999999999")

space_string(117.5, 17.5, 5.5, "99999999999")

can.showPage()
can.setFont("Courier-Bold", 12)

space_string(60.5, 255.8, 5.5, "99999999999")

space_string(60.5, 244.2, 5.5, "99999999999")
space_string(133.8, 244.2, 5.5, "99999999999")

space_string(60.5, 232.2, 5.5, "99999999999")
space_string(133.8, 232.2, 5.5, "99999999999")

space_string(60.5, 220.2, 5.5, "99999999999")

space_string(60.5, 208.5, 5.5, "99999999999")
space_string(133.8, 208.5, 5.5, "99999999999")

space_string(60.5, 197, 5.5, "99999999999")
space_string(133.8, 197, 5.5, "99999999999")

space_string(60.5, 177.5, 5.5, "99999999999")
space_string(133.8, 177.5, 5.5, "99999999999")

space_string(60.5, 166.5, 5.5, "99999999999")
space_string(133.8, 166.5, 5.5, "99999999999")

space_string(60.5, 154, 5.5, "99999999999")
space_string(133.8, 154, 5.5, "99999999999")

space_string(60.5, 142.5, 5.5, "99999999999")
space_string(133.8, 142.5, 5.5, "99999999999")



space_string(60.5, 108.2, 5.5, "99999999999")

space_string(60.5, 97, 5.5, "99999999999")

space_string(60.5, 84.5, 5.5, "99999999999")
space_string(133.8, 84.5, 5.5, "99999999999")

space_string(60.5, 72.5, 5.5, "99999999999")
space_string(133.8, 72.5, 5.5, "99999999999")

space_string(60.5, 53.5, 5.5, "99999999999")
space_string(133.8, 53.5, 5.5, "99999999999")

space_string(60.5, 42, 5.5, "99999999999")
space_string(133.8, 42, 5.5, "99999999999")

space_string(60.5, 30, 5.5, "99999999999")
space_string(133.8, 30, 5.5, "99999999999")

space_string(60.5, 18, 5.5, "99999999999")
space_string(133.8, 18, 5.5, "99999999999")


can.showPage()
can.setFont("Courier-Bold", 12)

space_string(118, 272.5, 5.5, "99999999999")

space_string(118, 260, 5.5, "99999999999")
space_string(118, 246.8, 5.5, "99999999999")
space_string(118, 234.5, 5.5, "99999999999")
space_string(118, 222, 5.5, "99999999999")

space_string(60.5, 182, 5.5, "99999999999")
space_string(133.8, 182, 5.5, "99999999999")

space_string(60.5, 166.5, 5.5, "99999999999")

space_string(60.5, 149, 5.5, "99999999999")
space_string(133.8, 149, 5.5, "99999999999")

space_string(60.5, 131.5, 5.5, "99999999999")
space_string(133.8, 131.5, 5.5, "99999999999")

space_string(60.5, 118.5, 5.5, "99999999999")

space_string(60.5, 105.5, 5.5, "99999999999")

space_string(60.5, 93.5, 5.5, "99999999999")

space_string(60.5, 80.5, 5.5, "99999999999")
space_string(133.8, 80.5, 5.5, "99999999999")

space_string(133.8, 45.5, 5.5, "99999999999")

space_string(133.8, 32.5, 5.5, "99999999999")

space_string(60, 20.5, 5.5, "99999999999")
space_string(133.8, 20.5, 5.5, "99999999999")


can.showPage()
can.setFont("Courier-Bold", 12)

space_string(118, 270.5, 5.5, "99999999999")

space_string(118, 254.5, 5.5, "99999999999")
space_string(118, 238.5, 5.5, "99999999999")

space_string(65, 210, 5.45, "99999999999")

space_string(117.5, 178.4, 5.45, "99999999999")
space_string(180.5, 178.4, 5.5, "99")

space_string(117.5, 168, 5.45, "99999999999")
space_string(180.5, 168, 5.5, "99")

space_string(117.5, 158, 5.45, "99999999999")
space_string(180.5, 158, 5.5, "99")

space_string(117.5, 147.5, 5.45, "99999999999")
space_string(180.5, 147.5, 5.5, "99")

space_string(117.5, 137, 5.45, "99999999999")
space_string(180.5, 137, 5.5, "99")

space_string(117.5, 126.5, 5.45, "99999999999")
space_string(180.5, 126.5, 5.5, "99")

space_string(117.5, 111.2, 5.45, "99999999999")
space_string(180.5, 111.2, 5.5, "99")

space_string(117.5, 80.2, 5.45, "99999999999")
space_string(180.5, 80.2, 5.5, "99")

write_string(118.2, 64.5, "X")

write_string(118.2, 51.5, "X")

space_string(117.5, 42, 5.45, "99999999999")
space_string(180.5, 42, 5.5, "99")

can.showPage()
can.setFont("Courier-Bold", 12)

write_string(118, 272.5, "Bank of Western Sahara")

space_string(157, 262, 5.45, "99")
space_string(169, 262, 5.45, "99")
space_string(181, 262, 5.45, "99")

space_string(148, 251.3, 5.5, "12345678")

write_string(118, 241, "Example Biz Ltd.")

space_string(93, 231.0, 5.5, "ABCDEFGHIJKLMNOPQR")

write_string(25, 199.5, "Sildicus H. J. Spillanger")
write_string(25, 183.5, "Example Biz Ltd.")
write_string(25, 167, "Hermit Example Person Esq.")

write_string(25, 150, "Apartment H, The Hermitage,")
write_string(25, 145, "Hermitage Road,")
write_string(25, 140, "Lindisfarne.")

write_string(25, 120.7, "ABCDEFGHIJKLMN")

write_string(25, 99.5, "Sildicus H. J. Spillanger")

write_string(25, 50, "Sildicus H. J. Spillanger")

space_string(23.5, 36, 5.5, "00")
space_string(37, 36, 5.5, "00")
space_string(50.5, 36, 5.5, "0000")

write_string(25, 22, "Director of Enforcement")

can.showPage()
can.setFont("Courier-Bold", 12)

can.showPage()
can.setFont("Courier-Bold", 12)

can.showPage()
can.setFont("Courier-Bold", 12)

can.save()

#move to the beginning of the StringIO buffer
buffer.seek(0)

overlay_pdf = PdfFileReader(buffer)
# read your existing PDF

existing_pdf = PdfFileReader(open("CT600.pdf", "rb"))
output = PdfFileWriter()

# add the "watermark" (which is the new pdf) on the existing page
page = existing_pdf.getPage(0)
page.mergePage(overlay_pdf.getPage(0))
output.addPage(page)

page = existing_pdf.getPage(1)
page.mergePage(overlay_pdf.getPage(1))
output.addPage(page)

page = existing_pdf.getPage(2)
page.mergePage(overlay_pdf.getPage(2))
output.addPage(page)

page = existing_pdf.getPage(3)
page.mergePage(overlay_pdf.getPage(3))
output.addPage(page)

page = existing_pdf.getPage(4)
page.mergePage(overlay_pdf.getPage(4))
output.addPage(page)

page = existing_pdf.getPage(5)
page.mergePage(overlay_pdf.getPage(5))
output.addPage(page)

page = existing_pdf.getPage(6)
page.mergePage(overlay_pdf.getPage(6))
output.addPage(page)

page = existing_pdf.getPage(7)
page.mergePage(overlay_pdf.getPage(7))
output.addPage(page)

page = existing_pdf.getPage(8)
page.mergePage(overlay_pdf.getPage(8))
output.addPage(page)

page = existing_pdf.getPage(9)
page.mergePage(overlay_pdf.getPage(9))
output.addPage(page)

page = existing_pdf.getPage(10)
page.mergePage(overlay_pdf.getPage(10))
output.addPage(page)

# finally, write "output" to a real file
outputStream = open("destination.pdf", "wb")
output.write(outputStream)
outputStream.close()

