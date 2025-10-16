function layout() {
  return {
    name: "macOS Center",
    getFrameAssignments: (windows, screenFrame) => {
      // percent
      const widthRatio = 0.70;
      const heightRatio = 0.70;
      const yOffset = 0.15;

      const width = screenFrame.width * widthRatio;
      const x = screenFrame.x + (screenFrame.width - width) / 2;

      const height = screenFrame.height * heightRatio;
      const y = screenFrame.y + (screenFrame.height - height) / 2;

      const sharedFrame = {
        x: x,
        y: y - (y * yOffset),
        width: width,
        height: height,
      };

      // Assign the same centered frame to all windows
      return windows.reduce((acc, win) => {
        acc[win.id] = sharedFrame;
        return acc;
      }, {});
    },
  };
}