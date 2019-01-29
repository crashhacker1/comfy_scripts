def grabcutbb(im, bbv):
    mask = np.full(im.shape[:2],cv2.GC_PR_BGD,np.uint8)

    for bb in bbv:
        if bb[4]:
            cv2.rectangle(mask, (bb[0], bb[1]), (bb[2], bb[3]), int(cv2.GC_FGD), -1)
        else:
            cv2.rectangle(mask, (bb[0], bb[1]), (bb[2], bb[3]), int(cv2.GC_BGD), -1)

    bgdModel = np.zeros((1,65),np.float64)
    fgdModel = np.zeros((1,65),np.float64)

    rect = (0, im.shape[:2][0]/2, im.shape[:2][1], im.shape[:2][0])

    cv2.grabCut(im, mask, rect, bgdModel, fgdModel, 5, cv2.GC_INIT_WITH_MASK)

    mask2 = np.where((mask==2)|(mask==0),0,1).astype('uint8')

    return mask2
