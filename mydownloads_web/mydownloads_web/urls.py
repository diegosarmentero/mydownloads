from django.conf.urls import patterns, include, url

from common import views

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # RPC
    url(r'^rpc/login', views.rpc_login, name="rpc"),
    # Examples:
    # url(r'^$', 'mydownloads_web.views.home', name='home'),
    # url(r'^mydownloads_web/', include('mydownloads_web.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
