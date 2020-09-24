n = getNumber("How many labels are in the file?", 2);
labelfile = File.openDialog("Select a File (a stack of images stored in a single .tif file)!");
for (i=1; i<=n; i++) {
		open(labelfile);
		setAutoThreshold("Default dark");
		setThreshold(i, i);
		run("Convert to Mask", "method=Default background=Dark black");
		objvar = "" + labelfile + " threshold=50 resampling=2 red green blue save=" + File.getDirectory(labelfile) + "mesh_" + i + ".obj";
		run("Wavefront .OBJ ...", objvar);
		close();
	}
