import requests
import PyPDF2
from gtts import gTTS
import os


with open("temp_pdf.pdf", "rb") as file:
    pdf_reader = PyPDF2.PdfFileReader(file)
    if pdf_reader.isEncrypted:
        print("PDF file is encrypted.")
    else:
        print("PDF file is not encrypted.")