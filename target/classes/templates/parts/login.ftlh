<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name :</label>
            <div class="col-sm-5">
                <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}" name="username"
                       value="<#if user??>${user.username}</#if>" placeholder="User name"/>
                <#if usernamError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-5">
                <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       name="password" placeholder="Password"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Password: </label>
                <div class="col-sm-5">
                    <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           name="password2" placeholder="Retype password"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Email: </label>
                <div class="col-sm-5">
                    <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                           value="<#if user??>${user.email}</#if>" placeholder="insert Email"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="g-recaptcha" data-sitekey="6LdRP7IZAAAAAAXhSL6vVK2VEnQMN8pLD3b7apYr"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm>
            <a href="/registration">Add new user</a>
        </#if>
        <button type="submit" class="btn btn-primary ml-3">
            <#if isRegisterForm>
            Create
            <#else>
            Sign in
        </button>
        </#if>
    </form>
</#macro>

<#macro logout>
    <br>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Sign out</button>
    </form>
</#macro>