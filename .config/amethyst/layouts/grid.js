// dynamic-grid-layout.js -- Dynamic Grid Layout for Amethyst
// Author: https://github.com/edgimar
// Source: https://github.com/ianyh/Amethyst/issues/1819
// Places windows in a grid that adapts rows and columns to the number of windows.
function layout() {
    return {
        name: 'Grid',
        initialState: {},
        commands: {},
        extends: null,

        // windows: array of window objects
        // screenFrame: { x, y, width, height }
        getFrameAssignments: function (windows, screenFrame, state, extendedFrames) {
            const assignments = {};
            const n = windows.length;

            if (n === 0) return assignments;

            // Determine Grid Dimensions: bias towards columns because screens are usually
            // wider than they are tall.
            const cols = Math.ceil(Math.sqrt(n));
            const rows = Math.ceil(n / cols);

            const cellHeight = Math.floor(screenFrame.height / rows);

            for (let i = 0; i < n; i++) {
                const win = windows[i];

                // Calculate which row and column this window belongs to
                const currentRow = Math.floor(i / cols);
                const colIndex = i % cols;

                // Check if we are on the final row
                const isLastRow = currentRow === rows - 1;

                // Calculate how many items are actually in this specific row
                // Usually it's 'cols', but the last row might have fewer (the remainder)
                const itemsInThisRow = isLastRow ? (n - (currentRow * cols)) : cols;

                // Calculate width for THIS specific row
                // If it's the last row with fewer items, they get wider.
                const cellWidth = Math.floor(screenFrame.width / itemsInThisRow);

                const frame = {
                    x: screenFrame.x + (colIndex * cellWidth),
                    y: screenFrame.y + (currentRow * cellHeight),
                    width: cellWidth,
                    height: cellHeight
                };

                // Rounding adjustments (Pixel Perfection)
                // Ensure the last item in a row hits the right edge
                if (colIndex === itemsInThisRow - 1) {
                    frame.width = screenFrame.x + screenFrame.width - frame.x;
                }
                // Ensure the items in the last row hit the bottom edge
                if (isLastRow) {
                    frame.height = screenFrame.y + screenFrame.height - frame.y;
                }

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
