<!DOCTYPE html>
<html>
<head>
    <title>Smart Unit Converter</title>

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(14px);
            border-radius: 16px;
            padding: 35px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.4);
        }

        .title {
            font-size: 28px;
            font-weight: 700;
            color: #fff;
        }

        .subtitle {
            color: #dcdcdc;
            font-size: 14px;
            margin-bottom: 25px;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px;
        }

        .convert-btn {
            background: linear-gradient(90deg, #f7971e, #ffd200);
            color: #000;
            font-weight: 600;
            border-radius: 12px;
            padding: 12px;
            border: none;
        }

        .convert-btn:hover {
            opacity: 0.9;
            transform: scale(1.01);
        }

        label {
            color: #f1f1f1;
            font-size: 14px;
            margin-bottom: 5px;
        }
    </style>
</head>

<body>

<div class="glass-card">

    <div class="text-center">
        <i class="bi bi-calculator-fill text-warning fs-1"></i>
        <div class="title mt-2">Smart Unit Converter</div>
        <div class="subtitle">Convert Length, Weight, Temperature & Height</div>
    </div>

    <form action="convert" method="post">

        <!-- Category -->
        <label>Conversion Type</label>
        <select name="category" id="category" class="form-select mb-3">
            <option value="length">Length</option>
            <option value="weight">Weight</option>
            <option value="temperature">Temperature</option>
            <option value="height">Height (Feet & Inches)</option>
        </select>

        <!-- Normal Input -->
        <div id="normalInput">
            <label>Value</label>
            <input type="number" name="value" step="any"
                   class="form-control mb-3"
                   placeholder="Enter value" required>
        </div>

        <!-- Height Input -->
        <div id="heightInput" style="display:none;">
            <label>Height</label>
            <div class="row mb-3">
                <div class="col">
                    <input type="number" name="feet" id="feet"
                           class="form-control"
                           placeholder="Feet">
                </div>
                <div class="col">
                    <input type="number" name="inches" id="inches"
                           class="form-control"
                           placeholder="Inches">
                </div>
            </div>
        </div>

        <!-- Units -->
        <div class="row mb-3">
            <div class="col">
                <label>From</label>
                <input name="from" class="form-control" placeholder="km, cm, kg, in, ft">
            </div>
            <div class="col">
                <label>To</label>
                <input name="to" class="form-control" placeholder="m, g, cm, ft">
            </div>
        </div>

        <button class="convert-btn w-100">
            <i class="bi bi-arrow-repeat"></i> Convert
        </button>

    </form>
</div>

<!-- JS -->
<script>
    const category = document.getElementById("category");
    const normalInput = document.getElementById("normalInput");
    const heightInput = document.getElementById("heightInput");

    const valueInput = document.querySelector("input[name='value']");
    const feetInput = document.getElementById("feet");
    const inchesInput = document.getElementById("inches");

    category.addEventListener("change", () => {
        if (category.value === "height") {
            normalInput.style.display = "none";
            heightInput.style.display = "block";
            valueInput.required = false;
            feetInput.required = true;
        } else {
            normalInput.style.display = "block";
            heightInput.style.display = "none";
            valueInput.required = true;
            feetInput.required = false;
            inchesInput.required = false;
        }
    });
</script>

</body>
</html>
