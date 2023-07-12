// Enter your code below the lines of the families' information

// Secret knowledge of the Zhang family:
namespace zhang {
    int bank_number_part(int secret_modifier) {
        int zhang_part{8'541};
        return (zhang_part*secret_modifier) % 10000;
    }
    namespace red {
        int code_fragment() {return 512;}
    }
    namespace blue {
        int code_fragment() {return 677;}
    }
}

// Secret knowledge of the Khan family:
namespace khan {
    int bank_number_part(int secret_modifier) {
        int khan_part{4'142};
        return (khan_part*secret_modifier) % 10000;
    }
    namespace red {
        int code_fragment() {return 148;}
    }
    namespace blue {
        int code_fragment() {return 875;}
    }
}

// Secret knowledge of the Garcia family:
namespace garcia {
    int bank_number_part(int secret_modifier) {
        int garcia_part{4'023};
        return (garcia_part*secret_modifier) % 10000;
    }
    namespace red {
        int code_fragment() {return 118;}
    }
    namespace blue {
        int code_fragment() {return 923;}
    }
}

// Enter your code below

namespace estate_executor {
  int assemble_account_number(int secret_modifier) {
    int account_number = 0;
    account_number += zhang::bank_number_part(secret_modifier);
    account_number += khan::bank_number_part(secret_modifier);
    account_number += garcia::bank_number_part(secret_modifier);
    return account_number;
  }
  int assemble_code() {
    int red = 0;
    int blue = 0;
    red += zhang::red::code_fragment();
    red += khan::red::code_fragment();
    red += garcia::red::code_fragment();
    blue += zhang::blue::code_fragment();
    blue += khan::blue::code_fragment();
    blue += garcia::blue::code_fragment();
    return red * blue;
  }
}