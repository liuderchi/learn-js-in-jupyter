#!/usr/bin/env node

const fs = require('fs');
const glob = require('glob');
const prettier = require('prettier');

const prettierCodeCell = content => {
  const res = JSON.parse(content);
  res.cells.filter(cell => cell.cell_type === 'code').forEach(cell => {
    code = prettier.format(cell.source.join(''), {
      parser: 'babylon',
      singleQuote: true,
      trailingComma: 'es5',
    });

    cell.source = code
      .split('\n')
      .slice(0, -1)
      .map((str, i, { length }) => (i === length - 1 ? str : `${str}\n`));
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
      const resultString = prettierCodeCell(contentString);
      fs.writeFileSync(file, resultString, 'utf8');
      process.stdout.write('done\n');
    });
  } catch (e) {
    throw e;
  }
});
