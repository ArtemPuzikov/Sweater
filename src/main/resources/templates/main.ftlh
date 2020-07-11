<#import "parts/common.ftlh" as c>


<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
                       placeholder="Search by tag">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" class="form-control" placeholder="Введите сообщение">
                </div>
                <div class="form-group">
                    <input type="text" name="tag" class="form-control" placeholder="Введите тэг">
                </div>
                <div class="custom-file">
                    <input type="file" name="file" class="form-control" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class=form-group>
                    <button type="submit" class="btn btn-primary mt-3">Добавить</button>
                </div>
            </form>
        </div>
    </div>
    <div class="card-columns">
        <#list messages as message>
            <div class="card my-2" style="width: 18rem;">
                <div>
                    <#if message.filename??>
                        <img src="/img/${message.filename}" class="card-img-top" height="200" width="300">
                    </#if>
                </div>
                <div class="card-body">
                    <h5 class="card-title">${message.tag}</h5>
                    <p class="card-text">${message.text}</p>
                    <div class="card-footer">
                        ${message.authorName}
                    </div>
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
</@c.page>