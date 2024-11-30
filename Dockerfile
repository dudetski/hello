# Используем официальный образ Jenkins
FROM jenkins/jenkins:lts

# Переключаемся на пользователя root для установки дополнительных плагинов и конфигурации
USER root

# Устанавливаем Docker и необходимые зависимости
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Добавляем пользователя Jenkins в группу Docker (для работы с Docker без sudo)
RUN usermod -aG docker jenkins

# Возвращаемся к пользователю Jenkins
USER jenkins
