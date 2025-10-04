# Comandos utiles para el proyecto
1. **Instalar dependencias**  (Es necesario tener Node instalado)
   ```bash
   npm install
   ```
   
2. **Iniciar tailwindcss** (es necesario estar en la raiz del proyecto)
   ```bash
    npx @tailwindcss/cli -i ./src/main/resources/static/css/input.css -o ./src/main/resources/static/css/output.css --watch
   ```

3. **Iniciar tailwindcss** (comando corto, este funciona porque hice un script en el package.json)
   ```bash
    npm run watch:css
   ```