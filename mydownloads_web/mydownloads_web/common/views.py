# -*- coding: utf-8 -*-
from django.http import HttpResponse
from django.utils import simplejson

from mydownloads_web import models


def rpc_login(request):
    result = {}
    data = simplejson.dumps(result)

    return HttpResponse(data, mimetype='application/json')