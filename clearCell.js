#!/usr/bin/env node

const fs = require('fs');
const glob = require('glob');

const clearCell = content => {
  const res = JSON.parse(content.slice());
  res.cells.forEach(cell => {
    if (cell.outputs && cell.outputs.length > 0) {
      cell.outputs = [];
    }
    if ('execution_count' in cell && cell.execution_count !== null) {
      cell.execution_count = null;
    }
  });
  return JSON.stringify(res, null, 1) + '\n';
};

glob('**/*.ipynb', null, function(err, files) {
  if (err) {
    throw err;
  }
  try {
    files.forEach(file => {
      process.stdout.write(`cleaning up ${file} ... `);
      const contentString = fs.readFileSync(file, 'utf8');
      const resultString = clearCell(contentString);
      fs.writeFileSync(file, resultString, 'utf8');
      process.stdout.write('done');
    });
  } catch (e) {
    throw e;
  }
});
