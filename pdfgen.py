from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from PyPDF2 import PdfWriter, PdfReader

def generate_pdf(text, output_path, output_name, password=None):
    # Create a PDF
    output_filename = f"{output_path}/{output_name}.pdf"
    c = canvas.Canvas(output_filename, pagesize=letter)
    width, height = letter

    # Add text to the PDF
    c.drawString(100, height - 100, text)
    c.save()

    # Add password protection if provided
    if password:
        add_password_protection(output_filename, password)

def add_password_protection(pdf_filename, password):
    # Create a password-protected PDF
    output_pdf_filename = f"{pdf_filename.split('.')[0]}_protected.pdf"
    pdf_writer = PdfWriter()
    pdf_reader = PdfReader(pdf_filename)

    for page_num in range(len(pdf_reader.pages)):
        pdf_writer.add_page(pdf_reader.pages[page_num])

    pdf_writer.encrypt(password)

    with open(pdf_filename, "wb") as output_pdf:
        pdf_writer.write(output_pdf)

    print(f"PDF with password protection generated: {pdf_filename}")

# Get user input
text_to_add = input("Enter text to put in PDF (press Enter for default): ") or "Hello, this is a sample text for the PDF."
output_path = input("Enter path to save the PDF (press Enter for default): ") or "."
output_name = input("Enter name for the PDF (press Enter for default): ") or "bluebadge"
user_password = input("Enter password for the PDF (press Enter for no password): ")

# Generate PDF
generate_pdf(text_to_add, output_path, output_name, user_password)