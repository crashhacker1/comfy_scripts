import numpy as np
import cv2
from matplotlib import pyplot as plt

img = cv2.imread('image0.jpg')              # img.shape : (413, 620, 3)
mask = np.zeros(img.shape[:2],np.uint8)   # img.shape[:2] = (413, 620)

bgdModel = np.zeros((1,65),np.float64)
fgdModel = np.zeros((1,65),np.float64)

rect = (10,10,700,700)

# this modifies mask
cv2.grabCut(img,mask,rect,bgdModel,fgdModel,5,cv2.GC_INIT_WITH_RECT)

# If mask==2 or mask== 1, mask2 get 0, other wise it gets 1 as 'uint8' type.
mask2 = np.where((mask==2)|(mask==0),0,1).astype('uint8')

# adding additional dimension for rgb to the mask, by default it gets 1
# multiply it with input image to get the segmented image
img_cut = img*mask2[:,:,np.newaxis]
cv2.imwrite('tr5.png', img_cut)
plt.subplot(211),plt.imshow(img)
plt.title('Input Image'), plt.xticks([]), plt.yticks([])
plt.subplot(212),plt.imshow(img_cut)
plt.title('Grab cut'), plt.xticks([]), plt.yticks([])
plt.show()

#bash command from imagemagick
#convert tr5_2.png -fuzz 1% -transparent black final.png
