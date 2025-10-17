Satty has a default desktop file in /usr/share/applications but if it didn't you would do this:
`cat ~/.local/share/applications/satty-2.desktop`
[Desktop Entry]
Exec=/usr/bin/satty -f
MimeType=image/png;
Name=satty
NoDisplay=true
Type=Application

update mimedb
`update-desktop-database ~/.local/share/applications`

set associaton
`xdg-mime default satty-open.desktop image/png`
