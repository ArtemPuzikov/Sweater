<#include "security.ftlh">

<div class="card-columns">
    <#list messages as message>
        <div class="card my-2" style="width: 18rem;">
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top" height="200" width="300">
                </#if>
            </div>
            <div class="card-body">
                <p class="card-text">${message.text}</p>
                <h5 class="card-title">#${message.tag}</h5>
                <div class="card-footer text-muted">
                    <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <#if message.author.id == currentUserId>
                        <a class="btn btn-secondary ml-5" href="/user-messages/${message.author.id}?message=${message.id}">
                            Edit
                        </a>
                    </#if>
                </div>
            </div>
        </div>
    <#else>
        No message
    </#list>
</div>