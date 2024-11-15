#Тут нет смысла в мультистейдже, так как нет сложной структуры с кучей зависимостей и тяжелыми промежуточными образами
# + нет артефактов, которые не должны попадать в итоговый образ

FROM python:3.9-slim

WORKDIR /app

# Копируем в контейнер только файл зависимостей, чтобы он его кэшировал и переиспользовал, это оптимизирует сборку 
COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

#этот порт надо открыть 
EXPOSE 5000 

# Команда для запуска приложения
CMD ["python", "app.py"]
