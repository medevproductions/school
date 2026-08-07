import os
import glob

base_dir = r"c:\Users\Admin\Documents\Escuela\Proyecto escuela"
manifests = glob.glob(os.path.join(base_dir, "**", "__manifest__.py"), recursive=True)

for m in manifests:
    with open(m, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace the text
    new_content = content.replace("'name': 'OpenEduCat", "'name': 'Edu")
    new_content = new_content.replace("'name': \"OpenEduCat", "'name': \"Edu")
    
    if new_content != content:
        with open(m, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {m}")
