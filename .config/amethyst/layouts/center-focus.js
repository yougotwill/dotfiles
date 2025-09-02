function layout() {
  return {
    name: "Center Focus",
    getFrameAssignments: (windows, screenFrame) => {
      if (screenFrame.width < 800) {
        // If the screen is too small, just use a 2-side-by-side layout
        const gridWidth = screenFrame.width / 2;
        const focusWidth = gridWidth;
        const gutterWidth = gridWidth;
        const rightGutterOffsetX = screenFrame.x + focusWidth;
        const cornerHeight = screenFrame.height / 2;

        let remainderHeight = 0;

        if (windows.length >= 2) {
          remainderHeight = cornerHeight / (windows.length - 2);
        }

        const focusFrame = {
          x: screenFrame.x,
          y: screenFrame.y,
          width: focusWidth,
          height: screenFrame.height,
        };

        const gutterFrame = {
          x: rightGutterOffsetX,
          y: screenFrame.y,
          width: gutterWidth,
          height: cornerHeight,
        };

        const frames = windows.map((window, index) => {
          if (windows.length == 1) {
            // If there is only one window, it should take up the full screen
            const frame = {
              x: screenFrame.x,
              y: screenFrame.y,
              width: screenFrame.width,
              height: screenFrame.height,
            };
            return { [window.id]: frame };
          } else {
            // If there are two windows, they should each take up half of the screen
            if (index == 0) {
              const frame = focusFrame;
              return { [window.id]: frame };
            } else if (index == 1) {
              let frame = gutterFrame;
              if (windows.length == 2) {
                frame.height = screenFrame.height;
              }
              return { [window.id]: frame };
            } else {
              const frame = {
                x: rightGutterOffsetX,
                y: screenFrame.y + cornerHeight + remainderHeight * (index - 2),
                width: gutterWidth,
                height: remainderHeight,
              };
              return { [window.id]: frame };
            }
          }
        });
        return frames.reduce((frames, frame) => ({ ...frames, ...frame }), {});
      } else {
        // If the screen is large enough, use a grid layout with a focus in the center
        const gridWidth = screenFrame.width / 4;
        const centerWidth = gridWidth * 2;
        const gutterWidth = gridWidth;
        const leftGutterOffsetX = screenFrame.x;
        const centerOffsetX = gridWidth;
        const rightGutterOffsetX = gridWidth + centerWidth;
        const cornerHeight = screenFrame.height / 2;
        const fullCornerHeight = screenFrame.height / 2;

        const centerFrame = {
          x: centerOffsetX,
          y: screenFrame.y,
          width: centerWidth,
          height: screenFrame.height,
        };

        const topLeftGutterFrame = {
          x: leftGutterOffsetX,
          y: screenFrame.y,
          width: gutterWidth,
          height: cornerHeight,
        };

        const topRightGutterFrame = {
          x: rightGutterOffsetX,
          y: screenFrame.y,
          width: gutterWidth,
          height: cornerHeight,
        };

        const bottomLeftGutterFrame = {
          x: leftGutterOffsetX,
          y: screenFrame.y + cornerHeight,
          width: gutterWidth,
          height: cornerHeight,
        };

        const bottomRightGutterFrame = {
          x: rightGutterOffsetX,
          y: screenFrame.y + cornerHeight,
          width: gutterWidth,
          height: cornerHeight,
        };

        let remainderHeight = 0;

        if (windows.length > 5) {
          remainderHeight = fullCornerHeight / (windows.length - 4);
        }

        const frames = windows.map((window, index) => {
          if (windows.length == 1) {
            // If there is only one window, it should take up the full screen
            const frame = centerFrame;
            return { [window.id]: frame };
          } else {
            // If there are two windows, they should each take up half of the screen
            if (index == 0) {
              const frame = centerFrame;
              return { [window.id]: frame };
            } else if (index == 1) {
              const frame = topLeftGutterFrame;
              return { [window.id]: frame };
            } else if (index == 2) {
              const frame = topRightGutterFrame;
              return { [window.id]: frame };
            } else if (index == 3) {
              const frame = bottomLeftGutterFrame;
              return { [window.id]: frame };
            } else if (index == 4 && windows.length == 5) {
              const frame = bottomRightGutterFrame;
              return { [window.id]: frame };
            } else {
              const frame = {
                x: rightGutterOffsetX,
                y: screenFrame.y + cornerHeight + remainderHeight * (index - 4),
                width: gutterWidth,
                height: remainderHeight,
              };
              return { [window.id]: frame };
            }
          }
        });
        return frames.reduce((frames, frame) => ({ ...frames, ...frame }), {});
      }
    },
  };
}
