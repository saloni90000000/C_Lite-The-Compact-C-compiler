import subprocess
import tkinter as tk
from tkinter import scrolledtext

class CompilerGUI(tk.Tk):
    def _init_(self):
        super()._init_()
        self.title("Mini C Compiler GUI")
        self.geometry("700x500")

        # Input Text Box
        self.input_label = tk.Label(self, text="Enter C code:")
        self.input_label.pack()
        self.input_text = scrolledtext.ScrolledText(self, height=10)
        self.input_text.pack(fill='x', padx=10, pady=5)

        # Run Button
        self.run_button = tk.Button(self, text="Run", command=self.run_code)
        self.run_button.pack(pady=10)

        # Output Text Box (read-only)
        self.output_label = tk.Label(self, text="Output:")
        self.output_label.pack()
        self.output_text = scrolledtext.ScrolledText(self, height=15, state='disabled')
        self.output_text.pack(fill='both', expand=True, padx=10, pady=5)

    def run_code(self):
        code = self.input_text.get("1.0", tk.END)
        try:
            # Run the compiler executable and send the input code
            process = subprocess.Popen(
                ['./mycompiler'],
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )
            stdout, stderr = process.communicate(input=code)

            # Display output and errors
            self.output_text.config(state='normal')
            self.output_text.delete("1.0", tk.END)
            if stdout.strip():
                self.output_text.insert(tk.END, stdout)
            if stderr.strip():
                self.output_text.insert(tk.END, "\n[Errors]:\n" + stderr)
            self.output_text.config(state='disabled')

        except Exception as e:
            self.output_text.config(state='normal')
            self.output_text.delete("1.0", tk.END)
            self.output_text.insert(tk.END, f"Failed to run compiler: {e}")
            self.output_text.config(state='disabled')


if _name_ == "_main_":
    app = CompilerGUI()
    app.mainloop()
