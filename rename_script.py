import os

base_dir = r"c:\Users\Admin\Documents\Escuela\Proyecto escuela\openeducat\openeducat_erp-18.0-beta"

for root, dirs, files in os.walk(base_dir):
    for file in files:
        if file == "__manifest__.py":
            filepath = os.path.join(root, file)
            with open(filepath, "r", encoding="utf-8") as f:
                content = f.read()
            
            content = content.replace("'name': 'OpenEduCat", "'name': 'Edu")
            content = content.replace('"name": "OpenEduCat', '"name": "Edu')
            content = content.replace("'author': 'OpenEduCat Inc'", "'author': 'Edu'")
            content = content.replace('"author": "OpenEduCat Inc"', '"author": "Edu"')
            content = content.replace("https://www.openeducat.org", "")
            
            with open(filepath, "w", encoding="utf-8") as f:
                f.write(content)

print("Manifests updated successfully!")
