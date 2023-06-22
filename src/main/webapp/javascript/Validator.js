function Validator(obj) {

    // tìm thẻ cha ngoài cùng từ input
    function getParent(input, formGroup) {
        while (input.parentElement) {
            if (input.parentElement.matches(formGroup)) {
                return input.parentElement
            }
            input = input.parentElement
        }
    }

    // tạo đối tượng với thuộc tính là các trường có giá trị là mảng lưu trữ các rule của trường đấy
    let selectorRules = {}

    function Validate(input, element) {

        let form_mesg = getParent(input, obj.formGroup).querySelector(obj.mesg)
        let mesg// = element.check(input.value)

        // lấy ra mảng rule của trường được blur
        let rules = selectorRules[element.selector]

        // xử lý việc rule sau khi đè rule trước
        // duyệt mảng, validator theo thứ tự, nếu rule đứng trước hết lỗi thì rule sau mới được kích hoạt
        for (let i = 0; i < rules.length; i++) {
            switch (input.type) {
                case `checkbox`:
                case `radio`: {
                    mesg = rules[i](form.querySelector(element.selector + `:checked`))
                    break
                }

                default:
                    mesg = rules[i](input.value)
            }

            if (mesg)
                break
        }

        if (mesg) {
            form_mesg.innerText = mesg
            getParent(input, obj.formGroup).classList.add(`invalid`)
        }
        else {
            form_mesg.innerText = ``
            getParent(input, obj.formGroup).classList.remove(`invalid`)
        }

        return !!mesg

    }

    // lấy form
    let form = document.querySelector(obj.form);

    if (form) {
        console.log(form)

        form.addEventListener(`submit`, function (e) {
            e.preventDefault()

            let isSuccess = true

            obj.rules.forEach(element => {
                let input = form.querySelector(element.selector)
                let isError = Validate(input, element)

                if (isError) {
                    isSuccess = false
                }
            })

            if (isSuccess) {
                if (typeof obj.submitSuccess === `function`) {
                    let enableInput = form.querySelectorAll(`[name]`)
                    let formValues = Array.from(enableInput).reduce(function (values, input) {

                        switch (input.type) {
                            case `radio`:
                                values[input.name] = form.querySelector(`input[name='${input.name}']:checked`).value
                                break
                            case `checkbox`:
                                let i = 0
                                if (input.matches(`:checked`)) {
                                    if (!Array.isArray(values[input.name])) {
                                        values[input.name] = []
                                    }

                                    values[input.name].push(input.value)
                                    ++i
                                }
                                if (i === 0) {
                                    values[input.name] = []
                                }
                                break
                            default:
                                values[input.name] = input.value
                        }

                        return values
                    }, {})

                    console.log(formValues)
                }
                else {
                    form.submit()
                }
            }


        })

        // lấy element của form
        obj.rules.forEach(element => {

            //  add có rule vào mảng của các trường tương ứng
            if (Array.isArray(selectorRules[element.selector])) {
                selectorRules[element.selector].push(element.check)
            } else {
                selectorRules[element.selector] = [element.check]
            }

            let inputs = form.querySelectorAll(element.selector)

            Array.from(inputs).forEach(function (input) {
                if (input) {
                    // input.onblur = function (e) {
                    //     Validate(input, element)
                    // }

                    input.addEventListener(`blur`, function (e) {
                        Validate(input, element)
                    })

                    input.addEventListener(`input`, function (e) {
                        let form_mesg = getParent(input, obj.formGroup).querySelector(obj.mesg)
                        form_mesg.innerText = ``
                        getParent(input, obj.formGroup).classList.remove(`invalid`)
                    })
                }
            })
        });
    }
}

required = function (selector, mesgCustom) {
    return {
        selector: selector,
        check: function (value) {
            // if (value === null)
            //     return value === mesgCustom || `Bạn chưa nhập trường này!`
            return value/*.trim()*/ ? undefined : mesgCustom || `Bạn chưa nhập trường này!`
        }
    }
}

ruleEmail = function (selector, mesgCustom) {
    return {
        selector: selector,
        check: function (value) {
            let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
            return regexEmail.test(value) ? undefined : mesgCustom || `Bạn chưa nhập trường này!`
        }
    }
}

rulePassword = function (selector, mesgCustom) {
    return {
        selector: selector,
        check: function (value) {
            let regexEmail = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,14}$/
            return regexEmail.test(value) ? undefined : mesgCustom || `Bạn chưa nhập trường này!`
        }
    }
}

equalPassword = function (selector, checkPass, mesgCustom) {
    return {
        selector: selector,
        check: function (value) {
            return value === checkPass() ? undefined : mesgCustom || `Bạn chưa nhập trường này!`
        }
    }
}