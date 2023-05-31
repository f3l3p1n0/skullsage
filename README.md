 <html>
  <body>
    <p align="center">
     <img src='https://i.postimg.cc/WzMPRXxZ/cooltext436688135909173.png'>
   </p>
    <img src='https://i.postimg.cc/wvPnq09G/1.png'>
    <img src='https://i.postimg.cc/44BhwCmb/2023-05-26-13-47.png'>
   <hr>
   <h3>¡Saludos! ¡Gracias por venir! 💚</h3>
   <p>
    ¡Bienvenid@ a mis archivos de configuración de BSPWM!<br>
    ¿Estás buscando la manera de personalizar tu ArchLinux?<br>
    Aquí encontrarás mi colección personal de archivos de configuración.<br>
    Siéntete libre de tomar cualquier cosa de aquí, ¡solo recuerda darme crédito por ello! :)  
   </p>
   <hr>
   <h3>🍀 Información</h3>
    <ul>
     <li>Sistema operativo: Arch Linux</li>
     <li>WM: bspwm</li>
     <li>Terminal: alacritty</li>
     <li>Shell: zsh</li>
     <li>Editor: neovim / vscode</li>
     <li>Compositor: picom</li>
     <li>Lanzador de aplicaciones: rofi</li>
    </ul>
   <hr>
   <h3>🔧 Setup</h3>
   <h4>Para poder instalar y configurar los dotfiles de forma automatizada debes seguir los siguientes pasos:</h4>
   <ol>
    <li>Descargar repositorio: git clone https://github.com/f3l3p1n0/skullsage.git</li>
    <li>Acceder al directorio skullsage: cd skullsage</li>
    <li>Ejecutar el instalador (no root): bash install.sh</li>
    <li>Durante la instalación te pedirá instalar el tema de Rofi. Debes elegir el último tema y presionar <strong>enter</strong>. Posteriormente debes presionar <strong>Alt + a</strong>.</li>
    <li>Deja que finalice la instalación hasta que se reinicie el sistema automáticamente.</li>
   </ol>
   <p><strong>¡Atención!</strong> Debes tener en cuenta que durante la instalación se te pedirá que introduzcas la contraseña como 'sudo'. Debes introducirla y presionar enter para que puedas proseguir la instalación de forma correcta.</p>
   <h3>❌ Posibles problemas y soluciones</h3>
  <h4>En esta sección se abarcarán los posibles problemas y soluciones que vayan surgiendo:</h4>
  <h5><ins>El powermenu se visualiza distorsionado o no funciona</ins></h5>
  <p>El powermenu en mi caso, está configurado para que se pueda visualizar correctamente en la resolución 1920x1080. Si en tu caso no lo visualizas correctamente, deberás dirigirte a la siguiente ruta: <strong>cd ~/.config/rofi/powermenu/</strong></p>
   <p>Posteriormente, deberás abrir el archivo <strong>config.rasi</strong></p>
   <p>En este archivo debes modificar la línea: <strong>mainbox-margin</strong> del apartado Global Properties. Ajusta los parámetros a tu gusto, puedes probar con <strong>15px 40px</strong>.</p>
   <h5><ins>Cambiar resolución a 1920x1080</ins></h5>
   <p>Debo avisar de que los archivos de configuración están adaptados para un monitor que utiliza la resolución 1920 por 1080. Por tanto, esto deberás de tenerlo en cuenta ya que muchos de los aspectos visuales del sistema pueden mostrarse un tanto disorsionados. En máquinas virtuales puede ser mucho más notorio.</p>
   <p>En caso de que visualices ciertos aspectos distorsionados, recomiendo que cambies a una resolución optima. Puedes ayudarte con <strong>Xrandr</strong>.</p>
   <h5><ins>La pantalla de bloqueo no carga la imagen correctamente o no se muestra como debería</ins></h5>
   <p>Para este caso lo que debes hacer es tener una imagen preparada.</p>
   <p>Debes situarte en el directorio donde se encuentra tu imagen.</p>
   <p>Posteriormente debes escribir la siguiente comanda en tu terminal: <strong>betterlockscreen -u ruta_de_tu_imagen</strong></p>
   <p>Espera que cargue tu imagen hasta visualizar <strong>'Done'</strong>.</p>
   <p>Finalmente podrás presionar <strong>ctrl + alt + l</strong> y visualizarás tu imagen en la pantalla de bloqueo.</p>
   <h3>👤 Autor</h3>
   <p>Los dotfiles no han sido originados al 100% pero si configurados por mi, <a href="https://github.com/f3l3p1n0">f3l3p1n0</a>.</p>
   <h3>📱 Redes sociales</h3>
   <a href="https://f3l3p1n0.github.io">Blog personal</a><br>
   <a href="https://www.youtube.com/@f3l3p1n0">Youtube</a><br>
   <a href="https://www.instagram.com/f3l3p1n0/?igshid=Mzc1MmZhNjY%3D">Instagram</a><br>
   <a href="https://www.linkedin.com/in/marc-mañé-lobato/">Linkedin</a><br>
  </body>
  </html>
