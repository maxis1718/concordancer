<!DOCTYPE html>

<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="{{ url_for('static', filename='css/base.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ url_for('static', filename='css/atomic.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ url_for('static', filename='css/search.css') }}" />

    <link rel="stylesheet" type="text/css" href="{{ url_for('static', filename='css/bootstrap.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ url_for('static', filename='css/bootstrap-theme.css') }}" />
    
    <link rel="stylesheet" href="{{ url_for('static', filename='css/font-awesome.css') }}" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="{{ url_for('static', filename='js/jquery.min.js') }}"></script>
    <script src="{{ url_for('static', filename='js/bootstrap.js') }}"></script>
    
    <script src="{{ url_for('static', filename='js/main.js') }}"></script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="input-groups p-r">
                    <input  class="search-bar m-0a fs-20 pl-8 pr-8 ol-0 fc-4 lh-xl" 
                            type="search" 
                            placeholder="e.g. forgot"
                            value="{{ query }}"
                            autocomplete="on" />
                    <button class="btn btn-primary p-a r-0 t-0 ol-0-force search-btn" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                    <div class="ta-r fc-a fw-200 pt-8 p-r r-0 total-results">total {{ count }} results</div>
                </div>
            </div>
        </div>
        <div class="row search-result-wrap">
            <div class="col-md-12">
                <table  cellpadding="0"
                        cellspacing="0">
                    {% for first, highlight, end in results %}
                    <tr>
                        <td><pre class="bc-n">{{ first }}</pre></td>
                        <td><pre class="bc-n">{{ highlight }}</pre></td>
                        <td><pre class="bc-n">{{ end }}</pre></td>
                    </tr>
                    {% endfor %}
                </table>
            </div>
        </div>
    </div>
</body>
</html>
