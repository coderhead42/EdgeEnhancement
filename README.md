EdgeEnhancement
===============

In this project, edges of a given image were enhanced after coming up with own procedure. The procedure included application of already known filters in a particular sequence.

Procedure
===============

* **Unsharp Mask** is applied to the given image. Photographic grain may be detected after this procedure.
* For removing this photographic grain, a **gaussian blur** was applied to the image before the unsharp mask.
* After applying the unsharp mask, we use **contrast stretching** to balance out or normalize the varying intensities around the edges.
* Since the above steps may also enhance insignificant noise in the image, we apply **noise reduction** in the last to achieve the final image.

This procedure although not perfect shows acceptable results.

GUI
===============

Gui for the above procedure is made in Matlab. It allows the user to adjust the amount of the filters applied in each step of the procedure.

