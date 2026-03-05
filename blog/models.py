from django.db import models
from django.utils import timezone


class Category(models.Model):
  name = models.CharField(max_length=50)

  def __str__(self):
    return self.name


class Article(models.Model):
  STATUS_CHOICES = (
      ('draft', 'Draft'),
      ('published', 'Published'),
  )
  title = models.CharField(max_length=200, unique=True)
  slug = models.SlugField(max_length=200, unique=True)
  category = models.ForeignKey(
      Category, on_delete=models.SET_NULL, null=True, related_name='articles')
  content = models.TextField(unique=True)
  excerpt = models.TextField(max_length=500, unique=True)

  published_at = models.DateTimeField(default=timezone.now)
  updated_at = models.DateTimeField(auto_now=True)
  status = models.CharField(
      max_length=20, choices=STATUS_CHOICES, default='draft')

  # class Meta:
  #   ordering = ('-published_at',)

  def __str__(self):
    return self.title
