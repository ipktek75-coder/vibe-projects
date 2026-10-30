$project = "readme-practice-guide"

if (Test-Path -LiteralPath $project) {
  Write-Host "Папка '$project' уже есть. Переименуйте её или выберите другую папку для запуска команды."
} else {
  New-Item -ItemType Directory -Path `
    "$project", `
    "$project\site-pages", `
    "$project\site-parts", `
    "$project\site-styles", `
    "$project\site-images", `
    "$project\site-texts", `
    "$project\project-docs" | Out-Null

@'
<!doctype html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Маленькая пекарня</title>
  <link rel="stylesheet" href="site-styles/main-style.css">
</head>
<body>
  <h1>Маленькая пекарня</h1>
  <p>Учебный макет простого сайта пекарни.</p>
  <nav>
    <a href="site-pages/about-page.html">О проекте</a>
    <a href="site-pages/contacts-page.html">Контакты</a>
  </nav>
</body>
</html>
'@ | Set-Content -LiteralPath "$project\main-page.html" -Encoding utf8

@'
# Заметки для будущего README

Заполните после изучения проекта:

- Что делает проект:
- Основные папки:
- Важные файлы:
- Как открыть проект:
- Что требует уточнения:
'@ | Set-Content -LiteralPath "$project\pre-README.md" -Encoding utf8

"Откройте файл main-page.html в браузере. У проекта нет установки и сложных зависимостей." | Set-Content -LiteralPath "$project\open-project.txt" -Encoding utf8

"<h1>О пекарне</h1><p>Страница с коротким описанием учебной пекарни.</p>" | Set-Content -LiteralPath "$project\site-pages\about-page.html" -Encoding utf8
"<h1>Контакты</h1><p>Здесь может быть адрес, телефон и форма связи.</p>" | Set-Content -LiteralPath "$project\site-pages\contacts-page.html" -Encoding utf8
"<header>Верхнее меню сайта</header>" | Set-Content -LiteralPath "$project\site-parts\top-menu.html" -Encoding utf8
"<footer>Подвал сайта</footer>" | Set-Content -LiteralPath "$project\site-parts\bottom-footer.html" -Encoding utf8

@'
body {
  font-family: Arial, sans-serif;
  max-width: 720px;
  margin: 40px auto;
  line-height: 1.5;
}
'@ | Set-Content -LiteralPath "$project\site-styles\main-style.css" -Encoding utf8

"Здесь будут изображения для сайта: фото витрины, логотип, иконки." | Set-Content -LiteralPath "$project\site-images\image-list.txt" -Encoding utf8
"Основные тексты сайта: описание пекарни, список услуг, контакты." | Set-Content -LiteralPath "$project\site-texts\site-texts.md" -Encoding utf8
"Цель проекта: показать структуру простого сайта и собрать README.md по фактам." | Set-Content -LiteralPath "$project\project-docs\project-purpose.md" -Encoding utf8

  Set-Location $project
  Get-ChildItem
}
