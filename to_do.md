# Add "upload files" button
```
from IPython.display import display
import ipywidgets as widgets
from pathlib import Path

def upload_files(b):
    uploaded = widgets.FileUpload(accept='', multiple=True)
    display(uploaded)

    for filename in uploaded.value:
        content = uploaded.value[filename]['content']
        with open(f"{filename}", "wb") as f:
            f.write(content)
        print(f"Uploaded file: {filename}")

upload_button = widgets.Button(description='Upload Files')
upload_button.on_click(upload_files)
display(upload_button)
```
See [Widget Events.ipynb](https://github.com/jupyter-widgets/ipywidgets/blob/39d3c5df684539830e2232ac9265abf4331555f1/docs/source/examples/Widget%20Events.ipynb) for more info on the _button_ widget. See also [ipywidgets 8.0.7](https://pypi.org/project/ipywidgets/) for more about _ipywidgets_ in general.
