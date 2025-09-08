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