# Win95 theme

## Instalation instructions

- Extract Classic95.tar.gz and copy folder to `~/.icons`
- Select icon pack from Menu > Preferences > Customize Look And Feel > Icon Theme
- Now go to the window border tab and import the `Micro95.obt` theme
- Now go to the Widget tab and enable the Raleigh widget theme
- Now change all the fonts on the tabs to "Go Mono 11"
- Lastly, right-click the applications menu panel widget, click "Menu" settings
  and select the `win95_startbutton.gif` icon

## Adding window snapping shortcuts

Edit `~/config/openbox/lxde-rc.xml` and add the following in the `<keyboard>` section:

```
<keybind key="W-Left">
  <action name="UnmaximizeFull" />
  <action name="MoveResizeTo">
    <x>0</x>
    <y>0</y>
    <height>97%</height>
    <width>50%</width>
  </action>
</keybind>
<keybind key="W-Right">
  <action name="UnmaximizeFull" />
  <action name="MoveResizeTo">
    <x>-0</x>
    <y>0</y>
    <height>97%</height>
    <width>50%</width>
  </action>
</keybind>
<keybind key="W-Up">
  <action name="UnmaximizeFull" />
  <action name="MoveResizeTo">
    <x>0</x>
    <y>0</y>
    <width>100%</width>
    <height>50%</height>
  </action>
</keybind>
<keybind key="W-Down">
  <action name="UnmaximizeFull" />
  <action name="MoveResizeTo">
    <x>0</x>
    <y>-0</y>
    <width>100%</width>
    <height>50%</height>
  </action>
</keybind>
```
