# import dependencues
import torch
import os
from vggt.models.vggt import VGGT
from vggt.utils.load_fn import load_and_preprocess_images

# set up device
device = "cuda" if torch.cuda.is_available() else "cpu"


# bfloat16 is supported on Ampere GPUs (Compute Capability 8.0+)
dtype = torch.bfloat16 if torch.cuda.get_device_capability()[
    0] >= 8 else torch.float16

# Initialize the model and load the pretrained weights.``
# This will automatically download the model weights the first time it's run, which may take a while.
print("Loading model")
model = VGGT.from_pretrained("facebook/VGGT-1B").to(device)

# Load and preprocess example images (replace with your own image paths)
image_index = 0
image_folder = "./examples/llff_fern/images"  # RELATIVE TO PARENT DIRECTORY
image_names = []

print("Getting images")
while True:
    # get temporary path
    image_temp_path = f"{image_folder}/{image_index:03d}.png"

    # add to list of images if path exists, else, break
    if os.path.isfile(image_temp_path):
        image_names.append(image_temp_path)
        image_index += 1
    else:
        break

print("Loading images")
images = load_and_preprocess_images(image_names).to(device)

print("Predicting")
with torch.no_grad():
    with torch.cuda.amp.autocast(dtype=dtype):
        # Predict attributes including cameras, depth maps, and point maps.
        predictions = model(images)

print(predictions)
