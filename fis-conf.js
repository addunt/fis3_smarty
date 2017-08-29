fis.set('project.ignore', ['static/assets/css/less/**', 'dist/**', 'components/**', 'node_modules/**', 'package.json', 'fis-conf.js', 'component.json']);

fis.require('smarty')(fis);

//自定义smarty定界符
fis.set('smarty', {
    'left_delimiter': '<{',
    'right_delimiter': '}>'
});


// 目前 fis3-smarty 要求至少设置个 namespace
fis.set('namespace', 'smarty_demo');

// default settings. fis3 release

// Global start
fis.match('*.{js,css}', {
    useHash: true
});

fis.match('::image', {
    useHash: false
});

fis.match('* .js', {
    optimizer: fis.plugin('uglify-js')
});

fis.match('* .css', {
    optimizer: fis.plugin('clean-css')
});

fis.match('*.less', {
    rExt: '.css',
    parser: fis.plugin('less')
})

fis.match('* .png', {
    optimizer: fis.plugin('png-compressor')
});

// Global end

// default media is `dev`，
fis.media('dev').match('*', {
    useHash: false,
    optimizer: null,
});
