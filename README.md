# fontify-face

Fontify symbols representing faces with that face.

# Usage

Enable `fontify-face-mode` in the buffer where you want the previews
to be active.

**Note**: the symbols are tested with `facep` predicate which means if
the package that defines the faces is not loaded they will **not** be
fontified.  If you want to see the previews you will have to require
the package that defines the faces first.

# Rationale

During theme or package development it is useful to see how the faces
look directly during development.  This saves time and provides
thighter feedback loop.  Happy theming!

![](https://i.imgur.com/MqBpJou.png)
