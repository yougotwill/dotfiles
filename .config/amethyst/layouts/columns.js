function layout() {
  return {
    name: "Columns",
    initialState: {},
    commands: {},
    extends: null,

    getFrameAssignments: (windows, screenFrame) => {
      const assignments = {};
      const n = windows.length;

      if (n === 0) return assignments;

      const columnWidth = Math.floor(screenFrame.width / windows.length);

      for (let i = 0; i < n; i++) {
        const win = windows[i];

        const frame = {
          x: screenFrame.x + (columnWidth * i),
          y: screenFrame.y,
          width: columnWidth,
          height: screenFrame.height,
        };

        assignments[win.id] = frame;
      }

      return assignments;
    },

    updateWithChange: function (change, state) {
      return state;
    },
    
    recommendMainPaneRatio: function (ratio, state) {
      return state;
    }
  };
}
