def grabcuthm(im, hm):
    size = hm.shape

    bright = np.amax(hm)

    ret,fgd = cv2.threshold(hm, FGD_BOUND * bright, 1 * bright, cv2.THRESH_BINARY)
    fgd[1:size[0]/2] = 0
    fgd[1:size[0], 1:size[1]/4] = 0
    fgd[1:size[0], size[1]*3/4:size[1]] = 0

    ret,pr_fgd = cv2.threshold(hm, FGD_BGD_SEP * bright, 1 * bright, cv2.THRESH_BINARY)
    pr_fgd -= fgd

    ret, bgd = cv2.threshold(hm, BGD_BOUND * bright, 1 * bright, cv2.THRESH_BINARY_INV)
    bgd[size[0]/3:size[0]] = 0

    ret,pr_bgd = cv2.threshold(hm, FGD_BGD_SEP * bright, 1 * bright, cv2.THRESH_BINARY_INV)
    pr_bgd -= bgd

    mask = cv2.GC_BGD * bgd + cv2.GC_FGD * fgd + cv2.GC_PR_BGD * pr_bgd + cv2.GC_PR_FGD * pr_fgd
    mask = mask.astype(np.uint8, copy=False)

    bgdModel = np.zeros((1,65),np.float64)
    fgdModel = np.zeros((1,65),np.float64)

    rect = (0, im.shape[:2][0]/2, im.shape[:2][1], im.shape[:2][0])

    cv2.grabCut(im, mask, rect, bgdModel, fgdModel, 5, cv2.GC_INIT_WITH_MASK)
    mask2 = np.where((mask==2)|(mask==0),0,1).astype('uint8')

    return mask2
